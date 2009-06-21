require 'test_helper'
require 'fakeweb'

class LinksSaveTest < Test::Unit::TestCase
  def setup
    FakeWeb.clean_registry
    FakeWeb.allow_net_connect = false
  end

  def test_public_posting
    FakeWeb.register_uri(:post, "http://USERNAME:PASSWORD@www.simpy.com:80/simpy/api/rest/SaveLink.do?accessType=1&href=http%3A%2F%2Fwww.example.com&note=This+is+a+fine+example+of+an+example&src=rsimpy&tags=one%2C+two%2C+three&title=This+is+my+title&urlNickname=Example", :string => post_response)

    links = RSimpy::Links.new 'USERNAME', 'PASSWORD'
    params = RSimpy::Parameters.new

    params[:title] = "This is my title"
    params[:href] = "http://www.example.com"
    params[:tags] = "one, two, three"
    params[:urlNickname] = "Example"
    params[:note] = "This is a fine example of an example"

    response = links.save params

    assert_equal "0", links.status_code
    assert_equal 'Link saved successfully.', links.status_message
  end

  def test_private_posting
    FakeWeb.register_uri(:post, "http://USERNAME:PASSWORD@www.simpy.com:80/simpy/api/rest/SaveLink.do?accessType=0&href=http%3A%2F%2Fwww.example.com&note=This+is+a+fine+example+of+an+example&src=rsimpy&tags=one%2C+two%2C+three&title=This+is+my+title&urlNickname=Example", :string => post_response)

    links = RSimpy::Links.new 'USERNAME', 'PASSWORD'
    params = RSimpy::Parameters.new

    params[:title] = "This is my title"
    params[:href] = "http://www.example.com"
    params[:tags] = "one, two, three"
    params[:accessType] = :private
    params[:urlNickname] = "Example"
    params[:note] = "This is a fine example of an example"

    response = links.save params
 
    assert_equal "0", links.status_code
    assert_equal 'Link saved successfully.', links.status_message
  end
end

