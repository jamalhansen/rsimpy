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

class LinksGetTest < Test::Unit::TestCase
  def setup
    FakeWeb.clean_registry
    FakeWeb.allow_net_connect = false
  end

  def test_getting_links_without_date
    FakeWeb.register_uri(:get, "http://USERNAME:PASSWORD@www.simpy.com:80/simpy/api/rest/GetLinks.do?src=rsimpy&limit=12&q=waffles", :string => get_response)

    links = RSimpy::Links.new 'USERNAME', 'PASSWORD'
    params = RSimpy::Parameters.new :q => "waffles", :limit => 12

    response = links.get params

    assert links.success
    assert response.has_key? "links"
  end

  def test_getting_links_with_single_date
    FakeWeb.register_uri(:get, "http://USERNAME:PASSWORD@www.simpy.com:80/simpy/api/rest/GetLinks.do?date=2009-10-01&src=rsimpy&limit=12&q=waffles", :string => get_response)

    links = RSimpy::Links.new 'USERNAME', 'PASSWORD'
    params = RSimpy::Parameters.new :q => "waffles", :limit => 12, :date => Date.new(2009, 10, 01)

    response = links.get params

    assert links.success
    assert response.has_key? "links"
  end

  def test_getting_links_with_date_range
    FakeWeb.register_uri(:get, "http://USERNAME:PASSWORD@www.simpy.com:80/simpy/api/rest/GetLinks.do?afterDate=2009-10-01&beforeDate=2009-10-10&limit=12&q=waffles&src=rsimpy", :string => get_response)

    links = RSimpy::Links.new 'USERNAME', 'PASSWORD'
    params = RSimpy::Parameters.new :q => "waffles", :limit => 12, :beforeDate => Date.new(2009, 10, 10), :afterDate => Date.new(2009, 10, 01)

    response = links.get params

    assert links.success
    assert response.has_key? "links"
  end
end

class LinksDeleteTest < Test::Unit::TestCase
  def setup
    FakeWeb.clean_registry
    FakeWeb.allow_net_connect = false
  end

  def test_deleting_a_link
    # Simpy uses post for deletion
    FakeWeb.register_uri(:post, "http://USERNAME:PASSWORD@www.simpy.com:80/simpy/api/rest/DeleteLink.do?href=http%3A%2F%2Fwww.example.com&src=rsimpy", :string => delete_response)

    links = RSimpy::Links.new 'USERNAME', 'PASSWORD'
    response = links.delete RSimpy::Parameters.new(:href => "www.example.com")

    assert_equal "0", links.status_code
    assert_equal 'Link deleted successfully.', links.status_message
  end
end
