require 'yaml'
require 'petit/core_ext'

module Petit

  autoload :Router,     'petit/router'
  autoload :RackHelper, 'petit/rack_helper'

  class << self

    def link_source=(source)
      @@link_source = source
    end

    def link_source
      @@link_source ||= "links.yml"
    end

    def links(source = link_source)
      unless @links
        @links = {}
        links = YAML::load(File.open(source))
        links.each do |key,url|
          @links["/#{key}"] = url
        end
        @links.rename_key("/root","/")
      end
      @links
    end

    # Default way to setup petit
    def config
      yield self
    end

  end
end

