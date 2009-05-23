require 'test_helper'

class UserTest < Test::Unit::TestCase
  def test_user_accepts_parameters_as_block
    user = RSimpy::User.new do
      login :rsimpy
      pass :sfdfdsd23
    end
    
    assert_equal 'rsimpy', user.username
    assert_equal 'sfdfdsd23', user.password
  end

  def test_user_accepts_parameters_as_hash
    user = RSimpy::User.new :login => 'rsimpy', :pass => 'sfdfdsd23'

    assert_equal 'rsimpy', user.username
    assert_equal 'sfdfdsd23', user.password
  end
end
