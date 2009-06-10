require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "rsimpy"
    gem.summary = %Q{API Wrapper for simpy.com}
    gem.email = "jamal.hansen@gmail.com"
    gem.homepage = "http://github.com/rubyyot/rsimpy"
    gem.authors = ["Jamal Hansen"]
    gem.add_dependency('httparty', '>= 0.4.2')
    gem.add_dependency('khayyam', '>= 0.0.1')
    gem.add_development_dependency('cucumber', '>= 0.3.11')
    gem.add_development_dependency('fakeweb', '>= 1.2.3')
    gem.add_development_dependency 'technicalpickles-jeweler'
    gem.rubyforge_project = "rsimpy"


    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end

require 'rubygems'
begin
  require 'cucumber'
  require 'cucumber/rake/task'

  Cucumber::Rake::Task.new(:features) do |t|
    t.cucumber_opts = "--require features/support/env.rb --require features/links/steps --require features/tags/steps --require features/notes/steps --format pretty"
  end

rescue LoadError
  desc 'Cucumber rake task not available'
  task :features do
    abort 'Cucumber rake task is not available. Be sure to install cucumber as a gem or plugin'
  end
end



require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/*_test.rb'
  test.verbose = true
end

begin
  require 'rcov/rcovtask'
  Rcov::RcovTask.new do |test|
    test.libs << 'test'
    test.pattern = 'test/*_test.rb'
    test.verbose = true
  end
rescue LoadError
  task :rcov do
    abort "RCov is not available. In order to run rcov, you must: sudo gem install spicycode-rcov"
  end
end


task :default => :test

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  if File.exist?('VERSION.yml')
    config = YAML.load(File.read('VERSION.yml'))
    version = "#{config[:major]}.#{config[:minor]}.#{config[:patch]}"
  else
    version = ""
  end

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "rsimpy #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

namespace :user do

  desc 'store simpy login in cleartext in your home directory for safekeeping.  Use rake user:config login=USERNAME pass=PASSWORD'
  task :config do
    require 'rsimpy'
    
    user = RSimpy::User.new ENV['login'], ENV['pass']
    config = RSimpy::Configuration.new RSimpy::ProfileStorageService.new
    config.user = user
    config.save
  end

end

