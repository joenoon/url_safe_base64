# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'url_safe_base64/version'

Gem::Specification.new do |spec|
  spec.name          = "url_safe_base64"
  spec.version       = UrlSafeBase64::VERSION
  spec.authors       = ["Joe Noon"]
  spec.email         = ["joenoon@gmail.com"]
  spec.description   = %q{Converts strings to/from a slightly modified base64 that contains only url-safe characters}
  spec.summary       = %q{Converts strings to/from a slightly modified base64 that contains only url-safe characters}
  spec.homepage      = "http://github.com/joenoon/url_safe_base64"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
