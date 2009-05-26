require 'test_helper'

class ParametersTest < Test::Unit::TestCase
  def test_can_initialize_with_hash
    params = RSimpy::Parameters.new :foo => 'bar'
    assert_equal 'bar', params[:foo]
  end

  def test_can_convert_to_querystring
    params = RSimpy::Parameters.new :foo => 'bar', :baz => 2
    assert_equal "baz=2&foo=bar&src=rsimpy", params.to_querystring
  end

  def test_empty_querystring_converts_to_empty_string
    params = RSimpy::Parameters.new 
    assert_equal "src=rsimpy", params.to_querystring
  end

  def test_can_add_value_to_params
    params = RSimpy::Parameters.new 
    params.add('myThang', 2)
    assert_equal "myThang=2&src=rsimpy", params.to_querystring
  end


  def test_querystring_formats_href
    params = RSimpy::Parameters.new :href => "www.example.com"
    assert(CGI.unescape(params.to_querystring).include? "http://www.example.com")
  end

  def test_querystring_formats_tags_if_array
    params = RSimpy::Parameters.new :tags => ['foo', 'bar']
    assert(CGI.unescape(params.to_querystring).include? "foo, bar")
  end

  def test_querystring_formats_tags_if_array
    params = RSimpy::Parameters.new :tags => "foo, bar"
    assert(CGI.unescape(params.to_querystring).include? "foo, bar")
  end
  
  def test_querystring_formats_dates
    now = Date.new(2009, 1, 9)
    params = RSimpy::Parameters.new :some_date => now 
    assert(CGI.unescape(params.to_querystring).include? "some_date=2009-01-09")
  end

  def test_querystring_formats_access_type
    params = RSimpy::Parameters.new :accessType => :private
    assert(CGI.unescape(params.to_querystring).include? "accessType=0")
  end

  def test_querystring_will_sort_parameters
    params = RSimpy::Parameters.new :foo => 'bar', :bar => 'baz', :cheese => 'cheddar'
    assert_equal 'bar=baz&cheese=cheddar&foo=bar&src=rsimpy', params.to_querystring
  end

  def test_querystring_adds_source
    params = RSimpy::Parameters.new :foo => 'bar'
    assert(CGI.unescape(params.to_querystring).include? "src=rsimpy")
  end
end
