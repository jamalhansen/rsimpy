require 'rubygems'
require 'test/unit'
require 'responsive'

$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'rsimpy'

class Test::Unit::TestCase
  include Responsive

  def get_client *args
    ClientStub.new.returns(*args)
  end
end


class ClientStub
  attr_accessor :link
  attr_reader :method

  def returns return_val=1
    @return_val = return_val
    return self
  end

  def get link
    @link = link
    @method = :get
    return @return_val
  end

  def delete link
    @link = link
    @method = :delete
    return @return_val
  end

  def post link
    @link = link
    @method = :post
    return @return_val
  end
end
