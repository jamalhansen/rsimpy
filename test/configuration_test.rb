require 'test_helper'
require 'storage_builder'
require 'storage_service_mock'

class ConfigurationTest < Test::Unit::TestCase
  def test_stored_configuration_is_easily_detectable
    config = RSimpy::Configuration.new StorageBuilder.new.with_stored_configuration('foo', 'bar').build
    assert config.stored?
  end

  def test_missing_configuration_is_easily_detectable
    config = RSimpy::Configuration.new StorageBuilder.new.without_stored_configuration.build
    assert !config.stored?
  end

  def test_can_save_user_info
    storage_service = StorageBuilder.new.without_stored_configuration.build
    config = RSimpy::Configuration.new storage_service
    config.user = RSimpy::User.new('foo', 'bar')

    assert config.save
    login, pass = storage_service.user.credentials
    assert_equal 'foo', login
    assert_equal 'bar', pass
  end
end

