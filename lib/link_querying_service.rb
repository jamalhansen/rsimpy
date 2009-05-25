module RSimpy
  class LinkQueryingService
    def initialize client
      @client = client
    end

    def get params=nil
      params = RSimpy::Parameters.new unless params
      @client.get build_link params
    end

    def build_link params
      params.add(:src, 'rsimpy')
      "/GetLinks.do?" << params.to_querystring
    end
  end
end