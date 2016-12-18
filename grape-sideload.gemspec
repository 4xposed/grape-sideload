# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'grape/sideload/version'

Gem::Specification.new do |spec|
  spec.name          = "grape-sideload"
  spec.version       = Grape::Sideload::VERSION
  spec.authors       = ["Daniel Climent"]
  spec.email         = ["stokp1@gmail.com"]

  spec.summary       = %q{Sideload resources on your JSON response in your Grape API}
  spec.description   = %q{Sideload resources on your JSON response in your Grape API}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'grape', '>= 0.14.0'

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
