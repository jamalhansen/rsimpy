
class StorageServiceMock
  attr_reader :user

  def initialize params
    @user = params[:user] if params
  end

  def stored?
    @user != nil
  end

  def save user
    @user = user
  end
end