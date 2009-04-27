require 'test_helper'

class UserTest < Test::Unit::TestCase
  def test_user_accepts_paramers
    user = RSimpy::User.new :username => 'rsimpy', :password => 'rstimpy'
    
    assert_equal 'rsimpy', user.username
    assert_equal 'rstimpy', user.password
  end
end
