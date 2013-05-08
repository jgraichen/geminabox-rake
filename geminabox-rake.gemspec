# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'geminabox/rake/version'

Gem::Specification.new do |spec|
  spec.name          = 'geminabox-gemhelper'
  spec.version       = Geminabox::Rake::VERSION
  spec.authors       = ['Jan Graichen']
  spec.email         = %w(jg@altimos.de)
  spec.description   = %q{Geminabox gemhelper task for building and releasing gems.}
  spec.summary       = %q{Geminabox gemhelper task for building and releasing gems.}
  spec.homepage      = 'https://github.com/jgraichen/geminabox-gemhelper'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = %w(lib)

  spec.add_dependency 'bundler', '~> 1.3'

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'gemhelper'
end
