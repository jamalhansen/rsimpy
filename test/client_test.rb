require 'test_helper'
require 'fakeweb'
require 'errors/user_not_provided_error'


class ClientTest < Test::Unit::TestCase
  should "get" do
    FakeWeb.allow_net_connect = false
    FakeWeb.register_uri("http://USERNAME:PASSWORD@www.simpy.com:80/simpy/api/rest/GetLinks.do", :string => get_response)

    response = RSimpy::Client.new(RSimpy::User.new('USERNAME', 'PASSWORD')).get("/GetLinks.do")

    assert response != nil
    assert_equal Hash, response['links'].class
  end

  should "throw user not provided if user !valid?" do
    begin
      client = RSimpy::Client.new(InvalidUser.new)
      flunk "should have thrown UserNotProvidedError"
    rescue RSimpy::UserNotProvidedError => e
      assert_equal RSimpy::UserNotProvidedError, e.class
    end
  end

  should "throw user not provided if user nil" do
    begin
      client = RSimpy::Client.new(nil)
      flunk "should have thrown UserNotProvidedError"
    rescue RSimpy::UserNotProvidedError => e
      assert_equal RSimpy::UserNotProvidedError, e.class
    end
  end
end

class InvalidUser
  def valid?
    false
  end
end
