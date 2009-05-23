require 'test_helper'
require 'fakeweb'


class ClientTest < Test::Unit::TestCase
  def test_connect
    assert true
  end

  def test_connect
    FakeWeb.allow_net_connect = false
    FakeWeb.register_uri("http://USERNAME:PASSWORD@www.simpy.com:80/simpy/api/rest/GetLinks.do", :string => "Authorized")

    result = RSimpy::Client.new(RSimpy::User.new(:login => 'USERNAME', :pass=> 'PASSWORD')).get("/GetLinks.do")

    assert_equal 200, result.code
    assert result != nil
  end
end
