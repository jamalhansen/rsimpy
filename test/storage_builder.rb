
class StorageBuilder
  def with_stored_configuration login, pass
    @user = RSimpy::User.new login, pass
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