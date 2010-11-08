require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "graytoad"
    gem.summary = "Graylog2 + Hoptoad"
    gem.description = "Notify both Graylog2 and Hoptoad with this wrapper."
    gem.homepage = "http://github.com/AlekSi/graytoad"
    gem.authors = ["Alexey Palazhchenko"]
    gem.add_dependency "hoptoad_notifier", "~> 2.3.0"
    gem.add_dependency "gelf", "~> 0.9.2"
    gem.add_development_dependency "shoulda", "~> 2.11.0"
    gem.add_development_dependency "mocha", "~> 0.9.9"
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

begin
  require 'rcov/rcovtask'
  Rcov::RcovTask.new do |test|
    test.libs << 'test'
    test.pattern = 'test/**/test_*.rb'
    test.verbose = true
    test.rcov_opts << '--exclude gem'
  end
rescue LoadError
  task :rcov do
    abort "RCov is not available. In order to run rcov, you must: gem install rcov"
  end
end

task :test => :check_dependencies

task :default => :test

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "Graytoad #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
