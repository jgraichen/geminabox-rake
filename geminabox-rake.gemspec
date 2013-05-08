# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = 'geminabox-rake'
  spec.version       = '1.0.1'
  spec.authors       = ['Jan Graichen']
  spec.email         = %w(jg@altimos.de)
  spec.description   = %q{Geminabox rake task for building and releasing gems.}
  spec.summary       = %q{Geminabox rake task for building and releasing gems.}
  spec.homepage      = 'https://github.com/jgraichen/geminabox-rake'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = %w(lib)

  spec.add_dependency 'bundler', '~> 1.3'
  spec.add_dependency 'geminabox'

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
end
