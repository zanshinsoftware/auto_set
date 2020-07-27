require_relative 'lib/auto_set/version'

Gem::Specification.new do |spec|
  spec.name          = "auto_set"
  spec.version       = AutoSet::VERSION
  spec.authors       = ["Felipe Diesel"]
  spec.email         = ["felipediesel@gmail.com"]

  spec.summary       = %q{automatically update a column from a relationship}
  spec.description   = %q{automatically update a column from a relationship}
  spec.homepage      = "http://github.com/felipediesel/auto_set"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "http://github.com/felipediesel/auto_set"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "activerecord", "> 4.0.0"
  spec.add_dependency "activesupport", "> 4.0.0"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"

  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rspec-nc"
  spec.add_development_dependency "guard"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "fuubar"
  spec.add_development_dependency "coveralls"

  spec.add_development_dependency 'sqlite3'
end
