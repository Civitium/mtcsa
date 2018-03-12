# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mtcsa/version'

Gem::Specification.new do |spec|
  spec.name          = "MTCSA"
  spec.version       = MTCSA::VERSION
  spec.authors       = ["Ellery Durgin"]
  spec.email         = ["ellery@crowdfiber.com"]
  spec.summary       = %q{Provides a Ruby interface to the USPS MTCSA dataset.}
  spec.description   = %q{TODO: Write a longer description. Optional.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.2"
  spec.add_development_dependency "simplecov"
  
end
