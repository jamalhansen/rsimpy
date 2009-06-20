$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', '..', 'lib'))

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', '..', 'test'))
require 'fakeweb'
require 'responsive'

require 'test/unit/assertions'
World(Test::Unit::Assertions)

require 'rsimpy'

def convert_symbols_and_dates key, value
  if /[Dd]ate/ =~ key
    return Date.strptime(value, '%m/%d/%Y')
  else
    return value unless value[0] == ":"[0]

    len = value.length
    value[1..len].to_sym
  end
end