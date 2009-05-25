module RSimpy
  class Links

    def initialize(login=nil, pass=nil)
      if (login && pass)
        @user = RSimpy::User.build do
          login login.to_sym
          pass pass.to_sym
        end
      else
        @user = RSimpy::User.new
      end
    end

    def save &block
      @params = RSimpy::Parameters.new
      instance_eval(&block)
      post @params
    end

    def get &block
      @params = RSimpy::Parameters.new
      instance_eval(&block)
      query @params
    end

    protected
      def title title
        @params.add :title, title
      end

      def href uri
        @params.add :href, format_uri(uri)
      end

      def tags tags
        @params.add :tags,  build_tag_string(tags)
      end

      def access_type type
        @params.add :accessType, 1 if type == :private
      end

      def url_nickname nickname
        @params.add :urlNickname, nickname
      end

      def note note
        @params.add :note, note
      end

      def q query
        @params.add :q, query
      end

      def limit limit
        @params.add :limit, limit
      end

      def date date, to=nil
        if to
          @params.add :afterDate, format_date(date)
          @params.add :beforeDate, format_date(to)
        else
          @params.add :date, format_date(date)
        end
        
      end

      def format_date date
        date.strftime("%Y-%m-%d")
      end

      def format_uri uri
        uri = 'http://' + uri unless uri[0..6] == 'http://'
        uri
      end

      def post params
        service = RSimpy::LinkPostingService.new(RSimpy::Client.new(@user))

        # Post
        service.post params
      end

      def query params
        service = RSimpy::LinkQueryingService.new(RSimpy::Client.new(@user))

        # Post
        service.get params
      end

      def build_tag_string tags
        tags.collect{|a| a + ", "}.to_s.chop.chop
      end
  end
end