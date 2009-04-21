$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', '..', '..', 'test'))
require 'test_helper'

Given /^the link "([^\"]*)"$/ do |link|
  @link = link
end

Given /^the user "([^\"]*)"$/ do |user|
  @user = user
end

Given /^the password "([^\"]*)"$/ do |password|
  @password = password
end

When /^I add the link$/ do
  @result = RSimpy::LinkPostingService.new(ClientStub.new).post :href => "http://example.com", :title => "Example"
end

Then /^the link is added to Simpy$/ do
  @result = 200
end
