require 'required_field_missing_error'

module RSimpy
  class LinkDeletingService
    attr_reader :success, :status_message, :status_code

    def initialize client
      @client = client
    end

    def execute params
      reset
      response = @client.delete build_link params
      
      @success = ((response.code == 200) && response['status']['code'] == "0")
      @status_code = response['status']['code']
      @status_message = response['status']['message']

      response
    end

    def build_link params
      raise(RSimpy::RequiredFieldMissingError.new(:href)) unless (params.has_key?(:href) && params[:href])
      "/DeleteLink.do?" << params.to_querystring
    end

    def reset
      @success = false
      @status_message = nil
      @status_code = nil
    end
  end
end