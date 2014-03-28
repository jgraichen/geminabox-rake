require 'uri'
require 'bundler/gem_helper'

module Geminabox
  class Rake < Bundler::GemHelper

    class << self
      def install_tasks(opts = {})
        opts[:dir] ||= caller.find{|c| /Rakefile:/}[/^(.*?)\/Rakefile:/, 1]
        new(opts[:dir], opts[:name], opts).install
      end
      alias_method :install, :install_tasks
    end

    def initialize(dir, name, opts = {})
      @hosts     = (opts[:host].is_a?(Array) ? opts[:host] : [ opts[:host] ]).map do |host|
        URI.parse(host)
      end
      @namespace = opts[:namespace]
      super File.absolute_path(dir), name
    end

    def install
      namespace geminabox_task_namespace do
        super
      end
    end

    protected

    def rubygem_push(path)
      params  = geminabox_host_params
      strings = geminabox_host_strings

      params.each_with_index do |param, i|
        sh("bundle exec gem push '#{path}' #{param}")
        Bundler.ui.confirm "Pushed #{name} #{version} to #{strings[i]}."
      end
    end

    def geminabox_host_params
      @hosts.map do |host|
        host ? "--host '#{host}'" : nil
      end
    end

    def geminabox_host_strings
      return 'default host' unless @hosts

      @hosts.map do |host|
        host.dup.tap do |uri|
          uri.user     = uri.password = nil
          uri.user     = '**' if uri.user
          uri.password = '**' if uri.password
        end
      end
    end

    def geminabox_task_namespace
      @namespace || 'geminabox'
    end
  end
end
