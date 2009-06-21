
require 'client'
require 'user'          
require 'parameters'  
require 'configuration'
require 'profile_storage_service'
require 'posting_service'
require 'querying_service'
require 'links'
require 'errors/user_not_provided_error'

module RSimpy
  def get_links param_hash={}
    user = build_user param_hash
    params = build_params param_hash

    client = RSimpy::Client.new(user)
    service = RSimpy::QueryingService.new RSimpy::GET_LINKS, client

    result = service.execute params
    result[:success] = service.success
    result
  end

  def build_user param_hash
    login = param_hash[:login] if param_hash.has_key? :login
    pass = param_hash[:pass] if param_hash.has_key? :pass

    if login && pass
      return RSimpy::User.new login, pass
    end

    build_user_from_configuration param_hash
  end

  def build_params param_hash
    param_hash[:params] || RSimpy::Parameters.new
  end

  def build_user_from_configuration param_hash
    storage_service = RSimpy::ProfileStorageService.new(param_hash[:config_file])
    config = RSimpy::Configuration.new storage_service

    if !config.stored?
      raise RSimpy::UserNotProvidedError "Please configure RSimpy or supply username and password"
    end

    config.get
  end
end                      


