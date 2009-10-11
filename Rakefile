require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

desc 'Default: run unit tests.'
task :default => :test

desc 'Test the url_safe_base64 plugin.'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end

desc 'Generate documentation for the url_safe_base64 plugin.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'UrlSafeBase64'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "joenoon-url_safe_base64"
    gemspec.summary = "Coverts strings to/from a slightly modified base64 that contains only url-safe characters"
    gemspec.description = "Coverts strings to/from a slightly modified base64 that contains only url-safe characters"
    gemspec.email = "joenoon@gmail.com"
    gemspec.homepage = "http://github.com/joenoon/url_safe_base64"
    gemspec.authors = ["Joe Noon"]
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end
