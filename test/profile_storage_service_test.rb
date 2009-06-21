require 'test_helper'

class ProfileStorageServiceTest < Test::Unit::TestCase
  context "basic operations" do
    setup do
      @fixture_path = File.join ['test', 'fixtures', 'user_pass']
      @service = RSimpy::ProfileStorageService.new  @fixture_path
    end

    should "have a default location of ~/.rsimpy" do
      path = File.expand_path(File.join(['~', '.rsimpy']))
      assert_equal path, @service.default_location
    end

    should "be stored? if config file exists" do
      assert @service.stored?
      assert !RSimpy::ProfileStorageService.new('wubba').stored?
    end
  end

  should "store_data" do
    fixture_path = File.join ['test', 'fixtures', 'test']

    service = RSimpy::ProfileStorageService.new  fixture_path
    user = RSimpy::User.new 'foo','bar'
    service.save user

    service = RSimpy::ProfileStorageService.new  fixture_path
    login, pass = service.get.credentials

    assert_equal 'foo', login
    assert_equal 'bar', pass
  end
end