require 'fakeweb'

class LinksSaveTest < Test::Unit::TestCase
  def test_public_posting
    FakeWeb.allow_net_connect = false
    FakeWeb.register_uri(:post, "http://USERNAME:PASSWORD@www.simpy.com:80/simpy/api/rest/SaveLink.do?urlNickname=Example&note=This+is+a+fine+example+of+an+example&src=rsimpy&tags=one%2C+two%2C+three&title=This+is+my+title&accessType=1&href=http%3A%2F%2Fwww.example.com", :string => "success")

    links = RSimpy::Links.new 'USERNAME', 'PASSWORD'
    response = links.save do
      title "This is my title"
      href "http://www.example.com"
      tags "one, two, three"
      url_nickname "Example"
      note "This is a fine example of an example"
    end

    assert_equal 200, response.code
    assert_equal 'success', response.body
  end

  def test_private_posting
    FakeWeb.allow_net_connect = false
    FakeWeb.register_uri(:post, "http://USERNAME:PASSWORD@www.simpy.com:80/simpy/api/rest/SaveLink.do?accessType=1&title=This+is+my+title&href=http%3A%2F%2Fwww.example.com&urlNickname=Example&src=rsimpy&tags=one%2C+two%2C+three&note=This+is+a+fine+example+of+an+example", :string => "success")

    links = RSimpy::Links.new 'USERNAME', 'PASSWORD'
    response = links.save do
      title "This is my title"
      href "http://www.example.com"
      access_type :private
      tags "one, two, three"
      url_nickname "Example"
      note "This is a fine example of an example"
    end

    assert_equal 200, response.code
    assert_equal 'success', response.body
  end
end

class LinksGetTest < Test::Unit::TestCase
  def test_getting_links_without_date
    FakeWeb.allow_net_connect = false
    FakeWeb.register_uri(:get, "http://USERNAME:PASSWORD@www.simpy.com:80/simpy/api/rest/GetLinks.do?src=rsimpy&limit=12&q=waffles", :string => "success")

    links = RSimpy::Links.new 'USERNAME', 'PASSWORD'
    response = links.get do
      q "waffles"
      limit 12
    end

    assert_equal 200, response.code
    assert_equal 'success', response.body
  end

    def test_getting_links_with_single_date
    FakeWeb.allow_net_connect = false
    FakeWeb.register_uri(:get, "http://USERNAME:PASSWORD@www.simpy.com:80/simpy/api/rest/GetLinks.do?date=2009-10-01&src=rsimpy&limit=12&q=waffles", :string => "success")

    links = RSimpy::Links.new 'USERNAME', 'PASSWORD'
    response = links.get do
      q "waffles"
      limit 12
      date Date.new 2009, 10, 01
    end

    assert_equal 200, response.code
    assert_equal 'success', response.body
  end

  def test_getting_public_posting_links_with_date_range
    FakeWeb.allow_net_connect = false
    FakeWeb.register_uri(:get, "http://USERNAME:PASSWORD@www.simpy.com:80/simpy/api/rest/GetLinks.do?afterDate=2009-10-01&src=rsimpy&limit=12&beforeDate=2009-10-10&q=waffles", :string => "success")

    links = RSimpy::Links.new 'USERNAME', 'PASSWORD'
    response = links.get do
      q "waffles"
      limit 12
      date Date.new(2009, 10, 01), Date.new(2009, 10, 10)
    end

    assert_equal 200, response.code
    assert_equal 'success', response.body
  end
end
