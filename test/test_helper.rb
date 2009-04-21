require 'rubygems'
require 'test/unit'

$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'rsimpy'

class Test::Unit::TestCase
  def get_client
    ClientStub.new.get_returns(1)
  end
end


class ClientStub
  attr_accessor :link
  attr_reader :code

  def get_returns return_val
    @return_val = return_val
    return self
  end

  def get link
    @link = link
    return @return_val
  end

  def post link
    @link = link
    @code = 200
  end
end
