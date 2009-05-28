require 'base_service'

module RSimpy
  GET_TAGS = "GetTags"
  GET_LINKS = "GetLinks"
  GET_NOTES = "GetNotes"

  class QueryingService < RSimpy::BaseService

    def initialize command, client
      @client = client
      @command = command
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
      "/#{@command}.do?" << params.to_querystring
    end
  end
end