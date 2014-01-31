# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'craps_shooter/version'

Gem::Specification.new do |spec|
  spec.name          = "craps_shooter"
  spec.version       = CrapsShooter::VERSION
  spec.authors       = ["Michael Irey"]
  spec.email         = ["michael.irey@gmail.com"]
  spec.summary       = %q{Craps simulation, to test out various strategies}
  spec.description   = %q{Craps simulation, to test out various strategies}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
