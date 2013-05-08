require 'bundler/gem_helper'

module Geminabox
  class Rake < Bundler::GemHelper

    class << self
      def install_tasks(opts = {})
        new(opts[:dir], opts[:name], opts).install
      end
      alias_method :install, :install_tasks
    end

    def initialize(dir, name, opts = {})
      @host      = opts[:host]
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
      sh("gem inabox '#{path}' #{geminabox_host_param}")
      Bundler.ui.confirm "Pushed #{name} #{version} to #{@host ? @host : 'default host'}."
    end

    def geminabox_host_param
      @host ? "--host '#{@host}'" : nil
    end

    def geminabox_task_namespace
      @namespace || 'geminabox'
    end
  end
end
