When /^I ([^\"]*) a user's note$/ do |verb|

end

Then /^I expect to remove the note with the url "([^\"]*)"$/ do |url|
  FakeWeb.register_uri(:post, url, :string => note_removing_response)

  @service = RSimpy::PostingService.new(RSimpy::DELETE_NOTE, @client)
  @response = @service.execute @p
end

Then /^I expect to save the note with the url "([^\"]*)"$/ do |url|
  FakeWeb.register_uri(:post, url, :string => note_saving_response)

  @service = RSimpy::PostingService.new(RSimpy::SAVE_NOTE, @client)
  @response = @service.execute @p
end

Given /^I have a note with the noteId of 1234$/ do

end

Then /^I expect to update the note with the url "([^\"]*)"$/ do |url|
  FakeWeb.register_uri(:post, url, :string => note_saving_response)

  @service = RSimpy::PostingService.new(RSimpy::SAVE_NOTE, @client)
  @response = @service.execute @p
end

When /^I query my notes$/ do

end

Then /^I expect to query the notes with the url "([^\"]*)"$/ do |url|
  FakeWeb.register_uri(:get, url, :string => note_querying_response)

  @service = RSimpy::QueryingService.new(RSimpy::GET_NOTES, @client)
  @response = @service.execute @p
end

Then /^notes are returned$/ do
  assert @response.has_key? 'notes'
end

