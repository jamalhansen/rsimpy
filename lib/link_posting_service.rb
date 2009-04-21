module RSimpy
  class LinkPostingService
    def initialize client
      @client = client
    end

    def post params
      @params = params
      @client.post build_link
    end

    def build_link
      "/SaveLink.do?title=#{@params[:title]}&href=#{@params[:href]}&accessType=1"
    end
  end
end