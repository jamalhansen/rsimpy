require 'base_service'

module RSimpy
  class LinkQueryingService < RSimpy::BaseService

    def initialize client
      @client = client
    end
    
    def execute params
      params = RSimpy::Parameters.new unless params

      reset
      response = @client.get build_link params

      @success = (response.code == 200)

      response
    end

    def build_link params
      params.add(:src, 'rsimpy')
      "/GetLinks.do?" << params.to_querystring
    end
  end
end