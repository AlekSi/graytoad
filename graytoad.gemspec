# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{graytoad}
  s.version = "0.0.7"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Alexey Palazhchenko"]
  s.date = %q{2010-11-08}
  s.description = %q{Notify both Graylog2 and Hoptoad with this wrapper.}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "graytoad.gemspec",
     "lib/graytoad.rb"
  ]
  s.homepage = %q{http://github.com/AlekSi/graytoad}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Graylog2 + Hoptoad}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<hoptoad_notifier>, ["~> 2.3.0"])
      s.add_runtime_dependency(%q<aleksi-gelf>, ["~> 0.9.780"])
    else
      s.add_dependency(%q<hoptoad_notifier>, ["~> 2.3.0"])
      s.add_dependency(%q<aleksi-gelf>, ["~> 0.9.780"])
    end
  else
    s.add_dependency(%q<hoptoad_notifier>, ["~> 2.3.0"])
    s.add_dependency(%q<aleksi-gelf>, ["~> 0.9.780"])
  end
end

