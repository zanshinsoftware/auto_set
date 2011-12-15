# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "auto_set/version"

Gem::Specification.new do |s|
  s.name        = "auto_set"
  s.version     = AutoSet::VERSION
  s.authors     = ["29sul Tecnologia da Informação"]
  s.email       = ["contato@29sul.com.br"]
  s.homepage    = ""
  s.summary     = %q{Updates a column from another model}
  s.description = %q{Updates a column from another model}

  s.rubyforge_project = "auto_set"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
