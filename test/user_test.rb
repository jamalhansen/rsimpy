require 'test_helper'

class UserTest < Test::Unit::TestCase
  context "initializing user" do
    setup do
      @login = 'rsimpy'
      @pass = 'sfdfdsd23'
    end

    should 'accept login and pass' do
      user = RSimpy::User.new @login, @pass
      assert_user_valid user
    end
  end

  context "validation" do
    should "be invalid if login missing" do
      user = RSimpy::User.new nil, "pass"
      assert !user.valid?
    end

    should "be invalid if pass missing" do
      user = RSimpy::User.new "login", nil
      assert !user.valid?
    end

    should "be valid if user and pass" do
      user = RSimpy::User.new "login", "pass"
      assert user.valid?
    end
  end
end


