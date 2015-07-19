# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth-youku-oauth2/version'

Gem::Specification.new do |spec|
  spec.name          = "omniauth-youku-oauth2"
  spec.version       = Omniauth::YoukuOauth2::VERSION
  spec.authors       = [""]
  spec.email         = [""]
  spec.description   = %q{OmniAuth Oauth2 strategy for youku.com.}
  spec.summary       = %q{OmniAuth Oauth2 strategy for youku.com.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
