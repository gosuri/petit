module Petit
  class << self

    def link_source=(source)
      @@link_source = source
    end

    def link_source
      @@link_source ||= "links.yml"
    end

    def links(source = link_source)
      @links ||= YAML::load(File.open(source))
    end

    # Default way to setup petit
    def config
      yield self
    end

  end
end

require 'petit/router'
require 'petit/rack_helper'
