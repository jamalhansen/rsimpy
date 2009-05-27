# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{rsimpy}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jamal Hansen"]
  s.date = %q{2009-05-26}
  s.default_executable = %q{simp}
  s.email = %q{jamal.hansen@gmail.com}
  s.executables = ["simp"]
  s.extra_rdoc_files = [
    "LICENSE",
    "README.rdoc"
  ]
  s.files = [
    "LICENSE",
    "README.rdoc",
    "Rakefile",
    "VERSION.yml",
    "bin/simp",
    "examples/post.rb",
    "examples/post_using_links.rb",
    "lib/base_service.rb",
    "lib/client.rb",
    "lib/configuration.rb",
    "lib/errors/connection_error.rb",
    "lib/errors/required_field_missing_error.rb",
    "lib/links.rb",
    "lib/links/link_deleting_service.rb",
    "lib/links/link_posting_service.rb",
    "lib/links/link_querying_service.rb",
    "lib/parameters.rb",
    "lib/profile_storage_service.rb",
    "lib/rsimpy.rb",
    "lib/tags.rb",
    "lib/tags/tag_merging_service.rb",
    "lib/tags/tag_removing_service.rb",
    "lib/tags/tag_renaming_service.rb",
    "lib/tags/tag_splitting_service.rb",
    "lib/user.rb",
    "test/client_test.rb",
    "test/configuration_test.rb",
    "test/fixtures/config",
    "test/fixtures/test",
    "test/link_deleting_service_test.rb",
    "test/link_posting_service_test.rb",
    "test/link_querying_service_test.rb",
    "test/links_test.rb",
    "test/parameters_test.rb",
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
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{API Wrapper for simpy.com}
  s.test_files = [
    "test/links_test.rb",
    "test/user_test.rb",
    "test/link_deleting_service_test.rb",
    "test/configuration_test.rb",
    "test/storage_service_mock.rb",
    "test/storage_builder.rb",
    "test/test_helper.rb",
    "test/link_querying_service_test.rb",
    "test/storage_service_test.rb",
    "test/link_posting_service_test.rb",
    "test/responsive.rb",
    "test/client_test.rb",
    "test/parameters_test.rb",
    "examples/post_using_links.rb",
    "examples/post.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<httparty>, [">= 0.4.2"])
      s.add_runtime_dependency(%q<khayyam>, [">= 0.0.1"])
      s.add_runtime_dependency(%q<khayyam>, [">= 0.0.1"])
      s.add_development_dependency(%q<jabber4r>, [">= 1.2.0"])
    else
      s.add_dependency(%q<httparty>, [">= 0.4.2"])
      s.add_dependency(%q<khayyam>, [">= 0.0.1"])
      s.add_dependency(%q<khayyam>, [">= 0.0.1"])
      s.add_dependency(%q<jabber4r>, [">= 1.2.0"])
    end
  else
    s.add_dependency(%q<httparty>, [">= 0.4.2"])
    s.add_dependency(%q<khayyam>, [">= 0.0.1"])
    s.add_dependency(%q<khayyam>, [">= 0.0.1"])
    s.add_dependency(%q<jabber4r>, [">= 1.2.0"])
  end
end
