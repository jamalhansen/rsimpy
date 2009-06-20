# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{rsimpy}
  s.version = "0.1.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jamal Hansen"]
  s.date = %q{2009-06-19}
  s.default_executable = %q{simp}
  s.email = %q{jamal.hansen@gmail.com}
  s.executables = ["simp"]
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
     "VERSION.yml",
     "bin/simp",
     "features/links/adding_a_link.feature",
     "features/links/querying_links.feature",
     "features/links/steps/link_steps.rb",
     "features/notes/query_note.feature",
     "features/notes/remove_note.feature",
     "features/notes/save_note.feature",
     "features/notes/steps/note_steps.rb",
     "features/support/env.rb",
     "features/tags/merge_tags.feature",
     "features/tags/querying_tags.feature",
     "features/tags/remove_tag.feature",
     "features/tags/rename_tag.feature",
     "features/tags/split_tag.feature",
     "features/tags/steps/tag_steps.rb",
     "lib/base_service.rb",
     "lib/client.rb",
     "lib/configuration.rb",
     "lib/errors/connection_error.rb",
     "lib/errors/required_field_missing_error.rb",
     "lib/links.rb",
     "lib/parameters.rb",
     "lib/posting_service.rb",
     "lib/profile_storage_service.rb",
     "lib/querying_service.rb",
     "lib/rsimpy.rb",
     "lib/user.rb",
     "nbproject/private/private.properties",
     "nbproject/private/private.xml",
     "nbproject/private/rake-d.txt",
     "nbproject/project.properties",
     "nbproject/project.xml",
     "rsimpy.gemspec",
     "test/client_test.rb",
     "test/configuration_test.rb",
     "test/deleting_service_test.rb",
     "test/fixtures/config",
     "test/fixtures/test",
     "test/links_test.rb",
     "test/parameters_test.rb",
     "test/posting_service_test.rb",
     "test/querying_service_test.rb",
     "test/required_field_missing_error_test.rb",
     "test/responsive.rb",
     "test/storage_builder.rb",
     "test/storage_service_mock.rb",
     "test/storage_service_test.rb",
     "test/test_helper.rb",
     "test/user_test.rb"
  ]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/rubyyot/rsimpy}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{rsimpy}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{API Wrapper for simpy.com}
  s.test_files = [
    "test/links_test.rb",
     "test/user_test.rb",
     "test/r_simpy_test.rb",
     "test/configuration_test.rb",
     "test/storage_service_mock.rb",
     "test/user_not_provided_error_test.rb",
     "test/storage_builder.rb",
     "test/test_helper.rb",
     "test/posting_service_test.rb",
     "test/storage_service_test.rb",
     "test/querying_service_test.rb",
     "test/deleting_service_test.rb",
     "test/required_field_missing_error_test.rb",
     "test/responsive.rb",
     "test/client_test.rb",
     "test/parameters_test.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<httparty>, [">= 0.4.2"])
      s.add_runtime_dependency(%q<khayyam>, [">= 0.0.1"])
      s.add_development_dependency(%q<cucumber>, [">= 0.3.11"])
      s.add_development_dependency(%q<fakeweb>, [">= 1.2.3"])
      s.add_development_dependency(%q<shoulda>, [">= 0"])
      s.add_development_dependency(%q<technicalpickles-jeweler>, [">= 0"])
    else
      s.add_dependency(%q<httparty>, [">= 0.4.2"])
      s.add_dependency(%q<khayyam>, [">= 0.0.1"])
      s.add_dependency(%q<cucumber>, [">= 0.3.11"])
      s.add_dependency(%q<fakeweb>, [">= 1.2.3"])
      s.add_dependency(%q<shoulda>, [">= 0"])
      s.add_dependency(%q<technicalpickles-jeweler>, [">= 0"])
    end
  else
    s.add_dependency(%q<httparty>, [">= 0.4.2"])
    s.add_dependency(%q<khayyam>, [">= 0.0.1"])
    s.add_dependency(%q<cucumber>, [">= 0.3.11"])
    s.add_dependency(%q<fakeweb>, [">= 1.2.3"])
    s.add_dependency(%q<shoulda>, [">= 0"])
    s.add_dependency(%q<technicalpickles-jeweler>, [">= 0"])
  end
end
