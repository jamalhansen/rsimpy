require 'test_helper'

class ParametersTest < Test::Unit::TestCase
  def test_can_initialize_with_hash
    params = RSimpy::Parameters.new :foo => 'bar'
    assert_equal 'bar', params[:foo]
  end

  def test_can_convert_to_querystring
    params = RSimpy::Parameters.new :foo => 'bar', :baz => 2
    
    querystring = params.to_querystring
    assert /foo=bar/ =~ querystring
    assert /baz=2/ =~ querystring
    assert /&/ =~ querystring
  end

  def test_empty_querystring_converts_to_empty_string
    params = RSimpy::Parameters.new 
    assert_equal "", params.to_querystring
  end

  def test_can_add_value_to_params
    params = RSimpy::Parameters.new 
    params.add('myThang', 2)
    assert_equal "myThang=2", params.to_querystring
  end
end
