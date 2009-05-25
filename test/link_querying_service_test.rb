require 'test_helper'

class LinkQueryingServiceCanDoABasicRequest < Test::Unit::TestCase
  def setup
    @client = get_client
    @action = "/GetLinks.do?"
  end

  def test_build_basic_link
    params = RSimpy::Parameters.new
    link = RSimpy::LinkQueryingService.new(@client).build_link(params)
    assert(/#{@action}/ =~ link)
  end   

  def test_basic_get
    service = RSimpy::LinkQueryingService.new(@client)
    assert_equal 1, service.get
  end

  def test_src_is_set
    params = RSimpy::Parameters.new
    link = RSimpy::LinkQueryingService.new(@client).build_link(params)
    assert(/src=rsimpy/ =~ link)
  end
end
