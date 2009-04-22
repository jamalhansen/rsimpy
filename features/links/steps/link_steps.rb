$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', '..', '..', 'test'))
require 'feature_helper'

Given /^a user of "([^\"]*)" with a password of "([^\"]*)"$/ do |user, password|
  @user = user
  @password = password
end

When /^I use RSimpy$/ do
  @params = RSimpy::Parameters.new
end

When /^the "([^\"]*)" is "([^\"]*)"$/ do |key, value|
  @params[key.to_sym] = value
end

When /^I tell RSimpy to save$/ do
  @client = ClientStub.new
  @result = RSimpy::LinkPostingService.new(@client).post @params
end

When /^I request a private link$/ do
  @params[:accessType] = 0
end

Then /^the link is added to Simpy$/ do
  @uri = @client.link
  assert /SaveLink.do\?/ =~ @uri
  assert 200 == @result
end

Then /^the link is public$/ do
  assert /accessType=1/ =~ @uri
end

Then /^the link is private$/ do
  assert /accessType=0/ =~ @uri
end

Then /^the uri contains "([^\"]*)" equals "([^\"]*)"$/ do |key, value|
  assert /#{@params[key]}=#{value}/ =~ @uri
end

