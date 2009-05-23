require 'test_helper'

class ConfigurationTest < Test::Unit::TestCase
  def test_stored_configuration_is_easily_detectable
    config = RSimpy::Configuration.new StorageBuilder.new.with_stored_configuration(:username => 'foo', :password => 'bar').build
    assert config.stored?
  end

  def test_missing_configuration_is_easily_detectable
    config = RSimpy::Configuration.new StorageBuilder.new.without_stored_configuration.build
    assert !config.stored?
  end

  def test_can_save_user_info
    storage_service = StorageBuilder.new.without_stored_configuration.build
    config = RSimpy::Configuration.new storage_service
    config.user = RSimpy::User.new(:login => 'foo', :pass => 'bar')

    assert config.save
    assert storage_service.user.username == 'foo'
    assert storage_service.user.password == 'bar'
  end
end

class StorageBuilder

  def with_stored_configuration params={}
    @user = RSimpy::User.new params
    return self
  end

  def without_stored_configuration
    @user = nil
    return self
  end

  def build
    StorageServiceMock.new :user => @user
  end
end

class StorageServiceMock
  attr_reader :user

  def initialize params
    @user = params[:user] if params
  end

  def stored?
    @user != nil
  end

  def save data={}
    @user = data[:user]
  end
end