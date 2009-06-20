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
      @storage_service.save @user
    end

    def get
      @storage_service.get
    end
  end
end