module RSimpy
  class LinkPostingService
    def initialize client
      @client = client
    end

    def post params
      @client.post build_link params
    end

    def build_link params
      "/SaveLink.do?title=#{params[:title]}&href=#{params[:href]}&accessType=1"
    end
  end
end