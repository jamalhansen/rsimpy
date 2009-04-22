module RSimpy
  class LinkPostingService
    def initialize client
      @client = client
    end

    def post params
      @client.post build_link params
    end

    def build_link params
      params.add(:accessType, 1) unless params[:accessType] == 0
    puts params.to_querystring
      "/SaveLink.do?" << params.to_querystring
    end
  end
end