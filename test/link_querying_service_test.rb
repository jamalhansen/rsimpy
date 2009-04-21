require 'test_helper'

class LinkQueryingServiceCanDoABasicRequest < Test::Unit::TestCase
  def setup
    @client = get_client
    @action = "/GetLinks.do"
  end

  def test_build_basic_link
    assert_equal @action, RSimpy::LinkQueryingService.new(@client).build_link
  end

  def test_basic_get
    service = RSimpy::LinkQueryingService.new(@client)
    assert_equal 1, service.get
    assert_equal @action, @client.link
  end

  protected
    
end
