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
    gem.add_dependency "aleksi-gelf", "~> 1.0.9999"
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "Graytoad #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
