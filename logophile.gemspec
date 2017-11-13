# coding: utf-8

require File.expand_path('lib/logophile/gem_version.rb', File.dirname(__FILE__))

Gem::Specification.new do |spec|
  spec.name          = 'logophile'
  spec.version       = Logophile::VERSION
  spec.authors       = ['yojique']
  spec.email         = ['yojique@gmail.com']

  spec.summary       = 'Localization integrity for Xcode projects'
  spec.description   = 'Logophile checks NSLocalizedString keys against multiple strings files'
  spec.homepage      = 'https://github.com/yojique/logophile'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'bin'
  spec.executables   << 'logophile'
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'xcodeproj', '~> 1.5'

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'rake', '~> 12.2'

  spec.required_ruby_version = '>= 2.0.0'
end
