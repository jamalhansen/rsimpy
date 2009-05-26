module RSimpy
  class LinkPostingService
    attr_reader :success, :status_message, :status_code

    def initialize client
      @client = client
    end

    def execute params
      reset
      response = @client.post build_link params

      @success = ((response.code == 200) && response['status']['code'] == "0")
      @status_code = response['status']['code']
      @status_message = response['status']['message']

      response
    end

    def build_link params
      params.add(:accessType, :public) unless params[:accessType] == :private
      "/SaveLink.do?" << params.to_querystring
    end

    def reset
      @success = false
      @status_message = nil
      @status_code = nil
    end
  end
end