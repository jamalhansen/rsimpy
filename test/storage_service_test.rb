require 'test_helper'

class ProfileStorageServiceTest < Test::Unit::TestCase
  def setup
    @fixture_path = File.join ['test', 'fixtures', 'config']
    @service = RSimpy::ProfileStorageService.new  @fixture_path
  end

  def test_default_location_is_in_home
    path = File.expand_path(File.join(['~', '.rsimpy']))
    assert_equal path, @service.default_location 
  end

  def test_stored_returns_true_if_config_file_exists
    assert @service.stored?
    assert !RSimpy::ProfileStorageService.new('wubba').stored?
  end

  def test_can_store_data
    fixture_path = File.join ['test', 'fixtures', 'test']
    service = RSimpy::ProfileStorageService.new  fixture_path
    user = RSimpy::User.new :username => 'foo', :password => 'bar'
    service.save :user => user

    service = RSimpy::ProfileStorageService.new  fixture_path
    data = service.get

    assert_equal 'foo', data[:user].username
    assert_equal 'bar', data[:user].password
  end
end