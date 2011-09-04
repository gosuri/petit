# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "petit"
  s.version     = "0.0.2"
  s.authors     = ["Greg Osuri"]
  s.email       = ["gosuri@gmail.com"]
  s.homepage    = "http://gr3g.me/petit"
  s.summary     = %q{a simple, fast, rack-based url shortening server}
  s.description = %q{a simple, fast, rack-based url shortening server}

  s.rubyforge_project = "petit"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = %w(petit)
  s.require_paths = ["lib"]

  s.add_runtime_dependency "rack"
  s.add_runtime_dependency "thor"
end
