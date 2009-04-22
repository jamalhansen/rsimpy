# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{rsimpy}
  s.version = "0.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jamal Hansen"]
  s.date = %q{2009-04-21}
  s.email = %q{jamal.hansen@gmail.com}
  s.extra_rdoc_files = ["README.rdoc", "LICENSE"]
  s.files = ["README.rdoc", "VERSION.yml", "lib/link_querying_service.rb", "lib/parameters.rb", "lib/user.rb", "lib/link_posting_service.rb", "lib/rsimpy.rb", "lib/client.rb", "test/feature_helper.rb", "test/test_helper.rb", "test/link_querying_service_test.rb", "test/link_posting_service_test.rb", "test/client_test.rb", "test/parameters_test.rb", "LICENSE"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/rubyyot/rsimpy}
  s.rdoc_options = ["--inline-source", "--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{API Wrapper for simpy.com}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<httparty>, [">= 0.4.2"])
      s.add_runtime_dependency(%q<khayyam>, [">= 0.0.1"])
    else
      s.add_dependency(%q<httparty>, [">= 0.4.2"])
      s.add_dependency(%q<khayyam>, [">= 0.0.1"])
    end
  else
    s.add_dependency(%q<httparty>, [">= 0.4.2"])
    s.add_dependency(%q<khayyam>, [">= 0.0.1"])
  end
end
