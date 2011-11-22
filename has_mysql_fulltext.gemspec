# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{has_mysql_fulltext}
  s.version = "0.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Pavel Dusanek"]
  s.date = %q{2011-11-22}
  s.description = %q{fulltext searching in mysql for rails, based at http://github.com/CodeOfficer/acts-as-mysql-fulltext}
  s.email = ["dusanek@iquest.cz"]
  s.extra_rdoc_files = [
    "LICENSE",
    "README.rdoc"
  ]
  s.files = [
    ".document",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "has_mysql_fulltext.gemspec",
    "lib/generators/has_mysql_fulltext/USAGE",
    "lib/generators/has_mysql_fulltext/install_generator.rb",
    "lib/generators/has_mysql_fulltext/templates/migration.rb",
    "lib/generators/has_mysql_fulltext/templates/model.rb",
    "lib/has_mysql_fulltext.rb",
    "lib/has_mysql_fulltext/index.rb",
    "lib/has_mysql_fulltext/index/class_methods.rb",
    "lib/has_mysql_fulltext/index/instance_methods.rb",
    "lib/has_mysql_fulltext/indexable.rb",
    "lib/has_mysql_fulltext/indexable/class_methods.rb",
    "lib/has_mysql_fulltext/indexable/instance_methods.rb",
    "scratchpad.txt",
    "spec/db/database.yml",
    "spec/db/models.rb",
    "spec/db/schema.rb",
    "spec/has_mysql_fulltext_spec.rb",
    "spec/something_with_fulltext_spec.rb",
    "spec/spec_helper.rb"
  ]
  s.homepage = %q{http://github.com/iquest/has_mysql_fulltext}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{fulltext searching in mysql for rails}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activerecord>, ["~> 3.1.0"])
      s.add_runtime_dependency(%q<mysql2>, [">= 0"])
      s.add_development_dependency(%q<shoulda>, [">= 0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.6.4"])
      s.add_development_dependency(%q<rcov>, [">= 0"])
      s.add_development_dependency(%q<rspec>, ["< 2.0.0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<activerecord>, [">= 0"])
    else
      s.add_dependency(%q<activerecord>, ["~> 3.1.0"])
      s.add_dependency(%q<mysql2>, [">= 0"])
      s.add_dependency(%q<shoulda>, [">= 0"])
      s.add_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.6.4"])
      s.add_dependency(%q<rcov>, [">= 0"])
      s.add_dependency(%q<rspec>, ["< 2.0.0"])
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<activerecord>, [">= 0"])
    end
  else
    s.add_dependency(%q<activerecord>, ["~> 3.1.0"])
    s.add_dependency(%q<mysql2>, [">= 0"])
    s.add_dependency(%q<shoulda>, [">= 0"])
    s.add_dependency(%q<bundler>, ["~> 1.0.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.6.4"])
    s.add_dependency(%q<rcov>, [">= 0"])
    s.add_dependency(%q<rspec>, ["< 2.0.0"])
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<activerecord>, [">= 0"])
  end
end

