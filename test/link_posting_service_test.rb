require 'test_helper'
require 'cgi'

class LinkPostingServiceCanDoABasicPost < Test::Unit::TestCase
  #http://www.simpy.com/doc/api/rest/SaveLink

  def setup
    FakeWeb.clean_registry
    FakeWeb.allow_net_connect = false

    @client = RSimpy::Client.new(RSimpy::User.new("USERNAME","PASSWORD"))
    @action = "/SaveLink.do"
  end

  def test_basic_post
    FakeWeb.register_uri(:post, "http://USERNAME:PASSWORD@www.simpy.com:80/simpy/api/rest/SaveLink.do?accessType=1&href=http%3A%2F%2Fexample.com&src=rsimpy&title=Example", :string => post_response)

    params = RSimpy::Parameters.new :href => "http://example.com", :title => "Example"
    service = RSimpy::LinkPostingService.new(@client)
    response = service.execute params

    assert service.success
  end
end

class LinkPostingServiceResponses < Test::Unit::TestCase

  def setup
    FakeWeb.clean_registry
    FakeWeb.allow_net_connect = false

    @client = RSimpy::Client.new(RSimpy::User.new("USERNAME","PASSWORD"))
  end

  def test_successful_response
    FakeWeb.register_uri(:post, "http://USERNAME:PASSWORD@www.simpy.com:80/simpy/api/rest/SaveLink.do?accessType=1&href=http%3A%2F%2Fexample.com&src=rsimpy&title=foo", :string => delete_response)

    service = RSimpy::LinkPostingService.new(@client)
    response = service.execute RSimpy::Parameters.new :href => "http://example.com", :title => "foo"

    assert service.success
    assert_equal "0", service.status_code
    assert_equal "Link deleted successfully.", service.status_message
  end
end
