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

## Rake task to create/update a .manifest file in your project, as well as update *.gemspec
desc %{Update ".manifest" with the latest list of project filenames. Respect\
.gitignore by excluding everything that git ignores. Update `files` and\
`test_files` arrays in "*.gemspec" file if it's present.}
task :manifest do
  list = Dir['**/*'].sort
  spec_file = Dir['*.gemspec'].first
  list -= [spec_file] if spec_file
  
  if File.exist?('.gitignore')
    File.read('.gitignore').each_line do |glob|
      glob = glob.chomp.sub(/^\//, '')
      list -= Dir[glob]
      list -= Dir["#{glob}/**/*"] if File.directory?(glob) and !File.symlink?(glob)
      puts "excluding #{glob}"
    end
  end

  if spec_file
    spec = File.read spec_file
    spec.gsub! /^(\s* s.(test_)?files \s* = \s* )( \[ [^\]]* \] | %w\( [^)]* \) )/mx do
      assignment = $1
      bunch = $2 ? list.grep(/^test\//) : list
      '%s%%w(%s)' % [assignment, bunch.join(' ')]
    end
      
    File.open(spec_file,   'w') {|f| f << spec }
  end
  File.open('.manifest', 'w') {|f| f << list.join("\n") }
end
