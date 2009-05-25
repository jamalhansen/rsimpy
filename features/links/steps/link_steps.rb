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

When /^I query the user's links$/ do
  @return_val = {"links"=>{"link"=>[{"title"=>"GitSubmoduleTutorial - GitWiki", "nickname"=>nil, "url"=>"http://git.or.cz/gitwiki/GitSubmoduleTutorial", "tags"=>{"tag"=>["git", "submodule"]}, "clicks"=>"1", "note"=>nil, "addDate"=>"2009-05-24 17:38", "modDate"=>"2009-05-24", "accessType"=>"public"}, {"title"=>"IKanServe - an Ioke web framework | Ola Bini: Programming Language Synchronicity", "nickname"=>nil, "url"=>"http://olabini.com/blog/2009/03/ikanserve-an-ioke-web-framework/", "tags"=>{"tag"=>["ioke", "web framework", "ikanserve"]}, "clicks"=>"1", "note"=>nil, "addDate"=>"2009-05-15 10:41", "modDate"=>"2009-05-15", "accessType"=>"public"}]}}

  @client = ClientStub.new.get_returns(@return_val)
  @bookmarks = RSimpy::LinkQueryingService.new(@client).get(@params)
end

Then /^the link is added to Simpy$/ do
  @uri = @client.link
  assert(/SaveLink.do\?/ =~ @uri)
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

Then /^the links are returned$/ do
  assert_equal @return_val.inspect, @bookmarks.inspect
end

