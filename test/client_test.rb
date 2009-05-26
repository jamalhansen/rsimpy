require 'test_helper'
require 'fakeweb'


class ClientTest < Test::Unit::TestCase
  def test_connect
    assert true
  end

  def test_get
    FakeWeb.allow_net_connect = false
    FakeWeb.register_uri("http://USERNAME:PASSWORD@www.simpy.com:80/simpy/api/rest/GetLinks.do", :string => get_response)

    response = RSimpy::Client.new(RSimpy::User.new('USERNAME', 'PASSWORD')).get("/GetLinks.do")

    assert response != nil
    assert_equal Hash, response['links'].class
  end
end
