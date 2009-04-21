$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', '..', '..', 'test'))
require 'feature_helper'

When /^I pass the link "([^\"]*)"$/ do |link|
  @link = link
end

When /^the title "([^\"]*)"$/ do |title|
  @title = title
end

Given /^the user "([^\"]*)"$/ do |user|
  @user = user
end

Given /^the password "([^\"]*)"$/ do |password|
  @password = password
end

When /^tell rsimpy to save$/ do
  params = RSimpy::Parameters.new :href => @link, :title => @title
  @result = RSimpy::LinkPostingService.new(ClientStub.new).post params
end

Then /^the link is added to Simpy$/ do
  assert 200 == @result
end
