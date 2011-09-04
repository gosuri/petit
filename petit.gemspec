# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "petit/version"

Gem::Specification.new do |s|
  s.name        = "petit"
  s.version     = Petit::VERSION
  s.authors     = ["Greg Osuri"]
  s.email       = ["gosuri@gmail.com"]
  s.homepage    = "http://gosuri.github.com/petit"
  s.summary     = %q{A simple URL redirector gem}
  s.description = %q{A simple URL redirector gem}

  s.rubyforge_project = "petit"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = %w(petit.rb) 
  s.require_paths = ["lib"]

  s.add_dependency "rack"
  s.add_dependency "thor"
  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
