require 'test_helper'

class RSimpyTest < Test::Unit::TestCase
  include RSimpy

  context "simple operations" do
    setup do
      FakeWeb.clean_registry
      FakeWeb.allow_net_connect = false
    end

    should "make getting links easy" do
      FakeWeb.register_uri(:get, "http://USERNAME:PASSWORD@www.simpy.com:80/simpy/api/rest/GetLinks.do?src=rsimpy", :string => get_response)

      result = get_links RSimpy::Parameters.new, 'USERNAME', 'PASSWORD'
      assert result[:success]
    end

    should "make getting links easier if you save user and pass" do
      FakeWeb.register_uri(:get, "http://USERNAME:PASSWORD@www.simpy.com:80/simpy/api/rest/GetLinks.do?src=rsimpy", :string => get_response)

      result = get_links RSimpy::Parameters.new, 'USERNAME', 'PASSWORD'
      assert result[:success]
    end
  end
end
