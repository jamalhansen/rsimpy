require 'test_helper'

class ParametersTest < Test::Unit::TestCase
  def test_can_initialize_with_hash
    params = RSimpy::Parameters.new :foo => 'bar'
    assert_equal 'bar', params[:foo]
  end
end
