require 'test_helper'
require 'cgi'
require 'errors/required_field_missing_error'

class LinkDeletingServiceCanDelete < Test::Unit::TestCase
  def setup
    FakeWeb.clean_registry
    FakeWeb.allow_net_connect = false

    @client = RSimpy::Client.new(RSimpy::User.new("USERNAME","PASSWORD"))
    @action = "/DeleteLink.do?"
  end

  def test_build_basic_link
    params = RSimpy::Parameters.new(:href => "http://www.example.com")
    link = RSimpy::PostingService.new(RSimpy::DELETE_LINK,
      @client).build_link(params)
    assert(/#{@action}/ =~ link)
  end   

  def test_basic_delete
    FakeWeb.register_uri(:post, "http://USERNAME:PASSWORD@www.simpy.com:80/simpy/api/rest/DeleteLink.do?href=http%3A%2F%2Fwww.example.com&src=rsimpy", :string => delete_response)

    service = RSimpy::PostingService.new(RSimpy::DELETE_LINK, @client)
    response = service.execute RSimpy::Parameters.new(:href => "http://www.example.com")
    assert service.success
    assert_equal Hash, response.class
  end

  def test_src_is_set
    params = RSimpy::Parameters.new(:href => "http://www.example.com")
    link = RSimpy::PostingService.new(RSimpy::DELETE_LINK, @client).build_link(params)
    assert(/src=rsimpy/ =~ link)
  end
end

class LinkDeletingServiceResponses < Test::Unit::TestCase
  def test_successful_response
    FakeWeb.register_uri(:post, "http://USERNAME:PASSWORD@www.simpy.com:80/simpy/api/rest/DeleteLink.do?href=http%3A%2F%2Fexample.com&src=rsimpy", :string => delete_response)

    client = RSimpy::Client.new(RSimpy::User.new("USERNAME","PASSWORD"))
    service = RSimpy::PostingService.new(RSimpy::DELETE_LINK, client)

    response = service.execute RSimpy::Parameters.new :href => "http://example.com"
    assert service.success
    assert_equal "0", service.status_code
    assert_equal "Link deleted successfully.", service.status_message
  end
end