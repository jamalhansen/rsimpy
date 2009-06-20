require 'errors/user_not_provided_error'

class UserNotProvidedErrorTest < Test::Unit::TestCase
  should "be of class UserNotProvidedError" do
    assert_equal RSimpy::UserNotProvidedError, RSimpy::UserNotProvidedError.new.class
  end
end
