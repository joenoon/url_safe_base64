require 'rake'
require 'rake/testtask'

desc 'Default: run unit tests.'
task :default => :test

desc 'Test the url_safe_base64 plugin.'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "url_safe_base64"
    gemspec.summary = "Converts strings to/from a slightly modified base64 that contains only url-safe characters"
    gemspec.description = "Converts strings to/from a slightly modified base64 that contains only url-safe characters"
    gemspec.email = "joenoon@gmail.com"
    gemspec.homepage = "http://github.com/joenoon/url_safe_base64"
    gemspec.authors = ["Joe Noon"]
  end
rescue LoadError
  puts "Jeweler not available. Install it with: gem install jeweler"
end
