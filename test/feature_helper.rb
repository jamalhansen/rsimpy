$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'test_helper'
require 'test/unit/assertions'

World do |world|
  world.extend(Test::Unit::Assertions)
  world
end
