module RSimpy
  class Facade

    def initialize(username=nil, password=nil)
      @user = build_user username, password
    end

    def post(url, title, tags=[])
      client = RSimpy::Client.new(@user)
      service = RSimpy::LinkPostingService.new(client)

      # Setup the post parameters
      params = RSimpy::Parameters.new :href => url, :title => title, :tags => build_tag_string(tags)

      # Post
      service.post params
    end

    def build_tag_string tags
      tags.collect{|a| a + ", "}.to_s.chop.chop
    end

    protected
      def get_configuration
        storage_service = RSimpy::ProfileStorageService.new
        config = RSimpy::Configuration.new storage_service

        if !config.stored?
          raise RuntimeError "Please configure RSimpy or supply username and password when creating a new instance of Facade."
        end

        @user = config.get
      end

      def build_user username, password
        if username == nil || password == nil
          get_configuration
        else
          Rsimpy::User.new(:username=> username, :password => password)
        end
      end
  end
end