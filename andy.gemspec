# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "andy/version"

Gem::Specification.new do |s|
  s.name        = "andy"
  s.version     = Andy::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Jason Staten"]
  s.email       = ["jstaten07@gmail.com"]
  s.homepage    = "http://rubygems.org/gems/andy"
  s.summary     = %q{Android Views using YAML}
  s.description = %q{Android Views using YAML}

  s.rubyforge_project = "andy"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  s.add_dependency "nokogiri"
end
