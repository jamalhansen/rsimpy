require 'test/unit'
require 'responsive'

$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'rsimpy'
require 'shoulda'

class Test::Unit::TestCase
  include Responsive
  
  def assert_user_valid user
    login, pass = user.credentials
    assert_equal @login, login
    assert_equal @pass, pass
  end
end

