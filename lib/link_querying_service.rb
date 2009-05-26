module RSimpy
  class LinkQueryingService
    attr_reader :success, :status_message, :status_code

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

    def reset
      @success = false
      @status_message = nil
      @status_code = nil
    end
  end
end