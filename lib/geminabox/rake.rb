require 'geminabox/rake/version'
require 'bundler/gem_helper'

module Geminabox
  class Rake < Bundler::GemHelper

    class << self
      def install_tasks(opts = {})
        new(opts[:dir], opts[:name], opts).install
      end
    end

    def initialize(dir, name, opts = {})
      @host = opts[:host]
      super dir, name
    end

    protected
    def rubygem_push(path)
      sh("gem inabox '#{path}' #{geminabox_host_param}")
      Bundler.ui.confirm "Pushed #{name} #{version} to #{@host ? @host : 'default host'}."
    end

    def geminabox_host_param
      @host ? "--host '#{@host}'" : nil
    end
  end
end
