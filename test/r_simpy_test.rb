require 'test_helper'

class RSimpyTest < Test::Unit::TestCase
  include RSimpy

  context "should be a mixin with simple operations for getting links" do
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

    should "make getting links easier if you pass config file location" do
      FakeWeb.register_uri(:get, "http://USERNAME:PASSWORD@www.simpy.com:80/simpy/api/rest/GetLinks.do?src=rsimpy", :string => get_response)

      location = File.join('test', 'fixtures', 'user_pass')
      result = get_links :config_file => location
      assert result[:success]
      assert result.has_key? "links"
    end

    should "get links without date" do
      FakeWeb.register_uri(:get, "http://USERNAME:PASSWORD@www.simpy.com:80/simpy/api/rest/GetLinks.do?src=rsimpy&limit=12&q=waffles", :string => get_response)

      result = get_links :params => RSimpy::Parameters.new( :q => "waffles", :limit => 12 ), :login => 'USERNAME', :pass => 'PASSWORD'
      assert result[:success]
      assert result.has_key? "links"
    end

    should "get links by date" do
      FakeWeb.register_uri(:get, "http://USERNAME:PASSWORD@www.simpy.com:80/simpy/api/rest/GetLinks.do?date=2009-10-01&src=rsimpy&limit=12&q=waffles", :string => get_response)

      params = RSimpy::Parameters.new( :q => "waffles", :limit => 12, :date => Date.new(2009, 10, 01) )
      result = get_links :params => params, :login => 'USERNAME', :pass => 'PASSWORD'
      assert result[:success]
      assert result.has_key? "links"
    end

    should "get links by date range" do
      FakeWeb.register_uri(:get, "http://USERNAME:PASSWORD@www.simpy.com:80/simpy/api/rest/GetLinks.do?afterDate=2009-10-01&beforeDate=2009-10-10&limit=12&q=waffles&src=rsimpy", :string => get_response)

      params = RSimpy::Parameters.new( :q => "waffles", :limit => 12, :beforeDate => Date.new(2009, 10, 10), :afterDate => Date.new(2009, 10, 01))
      result = get_links :params => params, :login => 'USERNAME', :pass => 'PASSWORD'
      assert result[:success]
      assert result.has_key? "links"
    end
  end

  context "deleting links" do
    should "delete a link" do
      # Simpy uses post for deletion
      FakeWeb.register_uri(:post, "http://USERNAME:PASSWORD@www.simpy.com:80/simpy/api/rest/DeleteLink.do?href=http%3A%2F%2Fwww.example.com&src=rsimpy", :string => delete_response)

      result = delete_link :params => RSimpy::Parameters.new(:href => "www.example.com" ), :login => 'USERNAME', :pass => 'PASSWORD'
      assert_equal "0", result['status']['code']
      assert_equal 'Link deleted successfully.', result['status']['message']
    end
  end
end
