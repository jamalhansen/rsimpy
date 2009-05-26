$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'test_helper'
require 'test/unit/assertions'
require 'responsive'

World(Test::Unit::Assertions)
require 'test_helper'


def convert_symbols value
  return value unless value[0] == 58

  len = value.length
  value[1..len].to_sym
end