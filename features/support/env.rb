$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', '..', 'lib'))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', '..', 'test'))

require 'test/unit/assertions'
World(Test::Unit::Assertions)

require 'rsimpy'
require 'responsive'


def convert_symbols_and_dates key, value
  if /[Dd]ate/ =~ key
    return Date.parse(value)
  else
    return value unless value[0] == 58

    len = value.length
    value[1..len].to_sym
  end
end