module RSimpy
  class LinkQueryingService
    def initialize client, params = {}
      @client = client
      @params = params
    end

    def get
      @client.get build_link
    end

    def build_link
      "/GetLinks.do"
    end
  end
end