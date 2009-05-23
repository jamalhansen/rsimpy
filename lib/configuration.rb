module RSimpy
  class Configuration
    attr_writer :user

    def initialize storage_service
      @storage_service = storage_service
    end

    def stored?
      @storage_service.stored?
    end

    def save
      @storage_service.save :user => @user
    end

    def get
      @storage_service.get[:user]
    end
  end
end