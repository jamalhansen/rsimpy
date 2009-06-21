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

      result = get_links :login => 'USERNAME', :pass => 'PASSWORD'
      assert result[:success]
      assert result.has_key? "links"
    end

    should "make getting links for a tag easy" do
      FakeWeb.register_uri(:get, "http://USERNAME:PASSWORD@www.simpy.com:80/simpy/api/rest/GetLinks.do?q=foo&src=rsimpy", :string => get_response)

      result = get_links :params => RSimpy::Parameters.new( :q => "foo" ), :login => 'USERNAME', :pass => 'PASSWORD'
      assert result[:success]
      assert result.has_key? "links"
    end

    should "make getting links easier if you save user and pass" do
      FakeWeb.register_uri(:get, "http://USERNAME:PASSWORD@www.simpy.com:80/simpy/api/rest/GetLinks.do?src=rsimpy", :string => get_response)

      location = File.join('test', 'fixtures', 'user_pass')
      result = get_links :config_file => location
      assert result[:success]
      assert result.has_key? "links"
    end
  end
end
