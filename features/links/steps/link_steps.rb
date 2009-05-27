$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', '..', '..', 'test'))
require 'fakeweb'
include Responsive

Given /^a user of "([^\"]*)" with a password of "([^\"]*)"$/ do |login, pass|
  FakeWeb.clean_registry
  FakeWeb.allow_net_connect=(false)

  @client = RSimpy::Client.new(RSimpy::User.new login, pass)
  @p = RSimpy::Parameters.new
end

When /^the "([^\"]*)" is "([^\"]*)"$/ do |key, value|
  @p[key.to_sym] = convert_symbols_and_dates(key, value)
end

Then /^I expect to post the url "([^\"]*)"$/ do |url|
  FakeWeb.register_uri(:post, url, :string => post_response)

  @service = RSimpy::PostingService.new(RSimpy::SAVE_LINK, @client)
  @response = @service.execute @p
end

Then /^the response is successful$/ do
  assert @service.success
end

When /^I expect to query the url "([^\"]*)"$/ do |url|
  FakeWeb.register_uri(:get, url, :string => get_response)

  @service = RSimpy::LinkQueryingService.new(@client)
  @response = @service.execute @p
end

Then /^the links are returned$/ do
  assert @response.has_key? "links"
end

When /^I query the user's links$/ do
  
end