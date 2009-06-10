include Responsive

When /^I ([^\"]*) a user's tags$/ do |verb|
  
end

Then /^I expect to split the tag with the url "([^\"]*)"$/ do |url|
  FakeWeb.register_uri(:post, url, :string => tag_splitting_response)

  @service = RSimpy::PostingService.new(RSimpy::SPLIT_TAG, @client)
  @response = @service.execute @p
end

Then /^I expect to merge the tags with the url "([^\"]*)"$/ do |url|
  FakeWeb.register_uri(:post, url, :string => tag_merging_response)

  @service = RSimpy::PostingService.new(RSimpy::MERGE_TAGS, @client)
  @response = @service.execute @p
end

Then /^I expect to rename the tag with the url "([^\"]*)"$/ do |url|
  FakeWeb.register_uri(:post, url, :string => tag_renaming_response)

  @service = RSimpy::PostingService.new(RSimpy::RENAME_TAG, @client)
  @response = @service.execute @p
end

Then /^I expect to remove the tag with the url "([^\"]*)"$/ do |url|
  FakeWeb.register_uri(:post, url, :string => tag_removing_response)

  @service = RSimpy::PostingService.new(RSimpy::REMOVE_TAG, @client)
  @response = @service.execute @p
end

When /^I query the user's tags$/ do

end

Then /^the tags are returned$/ do
  assert @response.has_key? "tags"
end

Then /^I expect to query tags from the url "([^\"]*)"$/ do |url|
  FakeWeb.register_uri(:get, url, :string => tag_querying_response)

  @service = RSimpy::QueryingService.new(RSimpy::GET_TAGS, @client)
  @response = @service.execute @p
end

