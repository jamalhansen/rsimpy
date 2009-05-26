require 'test_helper'

class LinkQueryingServiceCanDoABasicRequest < Test::Unit::TestCase
  def setup
    FakeWeb.clean_registry
    FakeWeb.allow_net_connect = false

    @client = RSimpy::Client.new(RSimpy::User.new("USERNAME","PASSWORD"))
    @action = "/GetLinks.do?"
  end

  def test_build_basic_link
    params = RSimpy::Parameters.new
    link = RSimpy::LinkQueryingService.new(@client).build_link(params)
    assert(/#{@action}/ =~ link)
  end   

  def test_basic_get
    FakeWeb.register_uri(:get, "http://USERNAME:PASSWORD@www.simpy.com:80/simpy/api/rest/GetLinks.do?src=rsimpy", :string => get_response)

    service = RSimpy::LinkQueryingService.new(@client)
    response = service.execute RSimpy::Parameters.new
    assert service.success
  end

  def test_src_is_set
    params = RSimpy::Parameters.new
    link = RSimpy::LinkQueryingService.new(@client).build_link(params)
    assert(/src=rsimpy/ =~ link)
  end
end
