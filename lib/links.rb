require 'posting_service'
require 'querying_service'

module RSimpy
  class Links
    #TODO move this functionality to RSimpy module
    attr_reader :success, :status_code, :status_message

    def initialize(login=nil, pass=nil)
      if (login && pass)
        @user = RSimpy::User.new login, pass
      else
        @user = get_user_from_file
      end
    end

    def get_user_from_file
      storage_service = RSimpy::ProfileStorageService.new
      config = RSimpy::Configuration.new storage_service

      if !config.stored?
        raise UserNotProvidedError "Please configure RSimpy or supply username and password"
      end

      config.get
    end

    def save params
      params.add(:accessType, :public) unless params.has_key? :accessType
      execute RSimpy::PostingService.new(RSimpy::SAVE_LINK, RSimpy::Client.new(@user)), params
    end

#    def get params
#      execute RSimpy::QueryingService.new(RSimpy::GET_LINKS, RSimpy::Client.new(@user)), params
#    end
#
#    def delete params
#      execute RSimpy::PostingService.new(RSimpy::DELETE_LINK, RSimpy::Client.new(@user)), params
#    end



    def execute service, params
      set_codes
      response = service.execute params
      set_codes service
      response
    end

    def set_codes service=nil
      if service
        @success = service.success
        @status_code = service.status_code
        @status_message = service.status_message
      else
        @success = false
        @status_code = nil
        @status_message =nil
      end
    end
  end
end