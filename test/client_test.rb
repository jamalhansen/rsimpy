require 'test_helper'

class RsimpyTest < Test::Unit::TestCase
  def test_connect
    result = RSimpy::Client.new(RSimpy::User.new('rsimpy','rsimpy')).get("/GetLinks.do")
    
    assert_equal 200, result.code
    assert result != nil
  end
end
