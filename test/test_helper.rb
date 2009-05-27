require 'test/unit'
require 'responsive'

$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'rsimpy'

class Test::Unit::TestCase
  include Responsive
end

