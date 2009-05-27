require 'link_querying_service'

module RSimpy
  class Links
    attr_reader :success, :status_code, :status_message

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
      @params.add(:accessType, :public) unless @params.has_key? :accessType
      execute RSimpy::PostingService.new(RSimpy::SAVE_LINK, RSimpy::Client.new(@user)), @params
    end

    def get &block
      @params = RSimpy::Parameters.new
      instance_eval(&block)
      execute RSimpy::LinkQueryingService.new(RSimpy::Client.new(@user)), @params
    end

    def delete &block
      @params = RSimpy::Parameters.new
      instance_eval(&block)
      execute RSimpy::PostingService.new(RSimpy::DELETE_LINK, RSimpy::Client.new(@user)), @params
    end

    def title title
      @params.add :title, title
    end

    def href uri
      @params.add :href, uri
    end

    def tags tags
      @params.add :tags, tags
    end

    def access_type type
      @params.add :accessType, type
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

    def execute service, params
      set_codes
      response = service.execute params
      set_codes service
      response
    end

    def set_codes service=nil
      if service
        @success = service.success
        @status_code = service.status_code
        @status_message = service.status_message
      else
        @success = false
        @status_code = nil
        @status_message =nil
      end
    end
  end
end