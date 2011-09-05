require 'yaml'
require 'petit/core_ext'

module Petit

  autoload :Router,     'petit/router'
  autoload :RackHelper, 'petit/rack_helper'

  class << self

    # optional config param to set the link source
    # default: "links.yml"
    #
    # Usage:
    #
    #   Petit.link_source = "app/links.yml"
    #
    mattr_accessor :link_source

    def link_source
      @@link_source ||= "links.yml"
    end
    # Loads the YAML file with link and returns a hash with urls
    #
    # source - source of the links file
    #
    # Example:
    #   # contents of links.yml
    #   # :root http://my_app_with_long_domain.com
    #   # :foo  http://bar.com
    #
    #   Petit.links("links.yml)
    #   # will return:
    #   # {
    #   # '/' => 'http://my_app_with_long_domain.com',
    #   # '/foo' => 'http://bar.com'
    #   # }
    #
    def links(source = self.link_source)
      unless @links
        @links = {}
        links = YAML::load(File.open(link_source))
        links.each do |key,url|
          @links["/#{key}"] = url
        end
        @links.rename_key("/root","/")
      end
      @links
    end

    # Default way to setup Petit
    # Petit.config do |config|
    #   config.link_source = "routes.yml"
    # end
    def config
      yield self
    end

    # @see Petit::Router.application
    def application
      Router.application
    end

    # @see Petit::Router.server
    def server
      Router.server
    end

  end
end

