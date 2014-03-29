# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'githubrepo/version'

Gem::Specification.new do |spec|
  spec.name          = 'githubrepo'
  spec.version       = Githubrepo::VERSION
  spec.authors       = ['Elikem Adadevoh']
  spec.email         = ['elikem@gmail.com']
  spec.description   = %q{Create GitHub repositories from the command line}
  spec.summary       = %q{CLI to create repositories}
  spec.homepage      = 'https://github.com/elikem/githubrepo'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.0'
  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'

  spec.add_runtime_dependency 'commander', '~> 4.1.6'
  spec.add_runtime_dependency 'httparty', '~> 0.13.0'
  spec.add_runtime_dependency 'json', '~> 1.8.1'
  spec.add_runtime_dependency 'json_pure', '~> 1.8.1'
end