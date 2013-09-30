# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{url_safe_base64}
  s.version = "0.2.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Joe Noon"]
  s.date = %q{2010-07-22}
  s.description = %q{Converts strings to/from a slightly modified base64 that contains only url-safe characters}
  s.email = %q{joenoon@gmail.com}
  s.extra_rdoc_files = [
    "README"
  ]
  s.files = [
    "MIT-LICENSE",
    "README",
    "Rakefile",
    "VERSION",
    "lib/url_safe_base64.rb",
    "test/url_safe_base64_test.rb",
    "url_safe_base64.gemspec"
  ]
  s.homepage = %q{http://github.com/joenoon/url_safe_base64}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Converts strings to/from a slightly modified base64 that contains only url-safe characters}
  s.test_files = [
    "test/url_safe_base64_test.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end

