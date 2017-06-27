# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "auto_set/version"

Gem::Specification.new do |spec|
  spec.name        = "auto_set"
  spec.version     = AutoSet::VERSION
  spec.licenses    = %w(MIT)
  spec.platform    = Gem::Platform::RUBY
  spec.authors     = ["Felipe Diesel"]
  spec.email       = ["felipediesel@gmail.com"]
  spec.homepage    = "http://github.com/felipediesel/auto_set"
  spec.summary     = %q{automatically update a column from a relationship}
  spec.description = %q{Automatically update a column from a relationship}

  spec.rubyforge_project = "auto_set"

  spec.files         = `git ls-files`.split("\n")
  spec.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  spec.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "activerecord", "> 4.0.0"
  spec.add_dependency "activesupport", "> 4.0.0"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"

  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rspec-nc"
  spec.add_development_dependency "guard"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "fuubar"
  spec.add_development_dependency "coveralls"

  spec.add_development_dependency 'sqlite3'
end