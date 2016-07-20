# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'xctestrunner/version'

Gem::Specification.new do |spec|
  spec.name          = 'xctestrunner'
  spec.version       = XCTestRunner::VERSION
  spec.authors       = ['Danielle Tomlinson']
  spec.email         = ['dan@tomlinson.io']

  spec.summary       = %q{A tool for automatically running your XCTest cases.}
  spec.homepage      = 'https://github.com/endocrimes/xctestrunner'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'claide', '>= 1.0.0', '< 2.0'
  spec.add_runtime_dependency 'xcodeproj', '>= 1.2.0', '< 2.0'

  spec.add_development_dependency 'bundler', '~> 1.12'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'guard', '~> 2.14'
  spec.add_development_dependency 'guard-rspec', '~> 4.7'
end
