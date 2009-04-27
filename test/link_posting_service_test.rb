require 'test_helper'
require 'cgi'

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
    link = CGI.unescape(@client.link)
    assert /\/SaveLink.do\?/ =~ link
    assert /title=Example/ =~ link
    assert /href=http:\/\/example.com/ =~ link
    assert /accessType=1/ =~ link
    assert /\?.*&.*&.*&/ =~ link
    assert /src=rsimpy/ =~ link
    assert_equal 200, result
  end
end
