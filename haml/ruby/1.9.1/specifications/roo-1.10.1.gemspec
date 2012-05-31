# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "roo"
  s.version = "1.10.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Thomas Preymesser"]
  s.date = "2011-11-14"
  s.description = "Roo can access the contents of various spreadsheet files. It can handle\n* Openoffice\n* Excel\n* Google spreadsheets\n* Excelx\n* Libreoffice\n* CSV"
  s.email = "thopre@gmail.com"
  s.executables = ["roo"]
  s.extra_rdoc_files = ["History.txt", "README.txt", "bin/roo", "lib/roo/.csv.rb.swp", "test/no_spreadsheet_file.txt"]
  s.files = ["bin/roo", "History.txt", "README.txt", "lib/roo/.csv.rb.swp", "test/no_spreadsheet_file.txt"]
  s.homepage = "http://roo.rubyforge.org/"
  s.rdoc_options = ["--main", "README.txt"]
  s.require_paths = ["lib"]
  s.rubyforge_project = "roo"
  s.rubygems_version = "1.8.16"
  s.summary = "Roo can access the contents of various spreadsheet files."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<spreadsheet>, ["> 0.6.4"])
      s.add_runtime_dependency(%q<nokogiri>, [">= 1.5.0"])
      s.add_runtime_dependency(%q<rubyzip>, [">= 0.9.4"])
      s.add_runtime_dependency(%q<google-spreadsheet-ruby>, [">= 0.1.5"])
      s.add_runtime_dependency(%q<choice>, [">= 0.1.4"])
      s.add_runtime_dependency(%q<todonotes>, [">= 0.1.0"])
      s.add_development_dependency(%q<bones>, [">= 3.7.1"])
    else
      s.add_dependency(%q<spreadsheet>, ["> 0.6.4"])
      s.add_dependency(%q<nokogiri>, [">= 1.5.0"])
      s.add_dependency(%q<rubyzip>, [">= 0.9.4"])
      s.add_dependency(%q<google-spreadsheet-ruby>, [">= 0.1.5"])
      s.add_dependency(%q<choice>, [">= 0.1.4"])
      s.add_dependency(%q<todonotes>, [">= 0.1.0"])
      s.add_dependency(%q<bones>, [">= 3.7.1"])
    end
  else
    s.add_dependency(%q<spreadsheet>, ["> 0.6.4"])
    s.add_dependency(%q<nokogiri>, [">= 1.5.0"])
    s.add_dependency(%q<rubyzip>, [">= 0.9.4"])
    s.add_dependency(%q<google-spreadsheet-ruby>, [">= 0.1.5"])
    s.add_dependency(%q<choice>, [">= 0.1.4"])
    s.add_dependency(%q<todonotes>, [">= 0.1.0"])
    s.add_dependency(%q<bones>, [">= 3.7.1"])
  end
end
