
require 'client'
require 'user'          
require 'parameters'  
require 'configuration'
require 'profile_storage_service'
require 'posting_service'
require 'querying_service'
require 'links'

module RSimpy
  def get_links params, user, pass
    client = RSimpy::Client.new(RSimpy::User.new(user, pass))
    service = RSimpy::QueryingService.new RSimpy::GET_LINKS, client

    result = service.execute params
    result[:success] = service.success
    result
  end
end                      


