require "petit/version"

module Petit

  # YML files with links
  mattr_accessor :links_file
  @@links_file = "links.yml"

  # Default way to setup petit
  def self.setup
    yield self
  end

  def server
  end
end
