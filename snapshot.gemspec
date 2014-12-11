# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'snapshot/version'

Gem::Specification.new do |spec|
  spec.name          = "snapshot"
  spec.version       = Snapshot::VERSION
  spec.authors       = ["Felix Krause"]
  spec.email         = ["snapshot@krausefx.com"]
  spec.summary       = %q{Snapshot - Create hundreds of iOS app screenshots automatically}
  spec.description   = %q{Take the pain out of taking iOS app screenshots.}
  spec.homepage      = "http://krausefx.com"
  spec.license       = "MIT"

  spec.required_ruby_version = '>= 2.0.0'

  spec.files = Dir["lib/**/*"] + %w{ bin/snapshot README.md LICENSE }

  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'json' # Because sometimes it's just not installed
  spec.add_dependency 'highline', '~> 1.6.21' # user inputs (e.g. passwords)
  spec.add_dependency 'colored' # coloured terminal output
  spec.add_dependency 'commander', '~> 4.2.0' # CLI parser
  spec.add_dependency 'fastimage', '~> 1.6.3' # fetch the image sizes from the screenshots

  spec.add_dependency 'fastlane'

  # Development only
  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec', '~> 3.1.0'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'yard', '~> 0.8.7.4'
  spec.add_development_dependency 'codeclimate-test-reporter'
end
