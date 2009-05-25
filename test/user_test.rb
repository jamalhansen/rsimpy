require 'test_helper'

class UserTest < Test::Unit::TestCase
  def test_building_user_with_block
    user = RSimpy::User.build do
      login :rsimpy
      pass :sfdfdsd23
    end

    login, pass = user.credentials
    assert_equal 'rsimpy', login
    assert_equal 'sfdfdsd23', pass
  end
end
