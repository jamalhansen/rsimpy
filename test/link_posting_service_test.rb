require 'test_helper'

class LinkPostingServiceCanDoABasicPost < Test::Unit::TestCase
  #http://www.simpy.com/doc/api/rest/SaveLink

  def setup
    @client = get_client
    @action = "/SaveLink.do"
  end

  def test_basic_post
    params = RSimpy::Parameters.new :href => "http://example.com", :title => "Example"
    service = RSimpy::LinkPostingService.new(@client)
    result = service.post params
    assert_equal "/SaveLink.do?title=Example&href=http://example.com&accessType=1",  @client.link
    assert_equal 200, result
  end
end
