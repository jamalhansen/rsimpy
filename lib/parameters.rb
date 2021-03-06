require 'cgi'

module RSimpy
  class Parameters
    RSIMPY_SOURCE = 'rsimpy'

    def initialize params={}
      @params = params
    end

    def [] key
      @params[key]
    end

    def []= key, value
      @params[key] = value
    end

    def has_key? key
      @params.has_key? key
    end

    def to_querystring
      output = ""
      add_src

      @params.sort {|a,b| a.to_s<=>b.to_s}.each do |key, value|
        value = format key, value
        value = CGI.escape(value) if value.class == String
        output << "#{key.to_s}=#{value}&"
      end

      output.chop
    end

    def add_src
      @params[:src] = RSIMPY_SOURCE unless @params.has_key? :src
    end

    def format key, value
      case key
      when(:href)
        format_uri(value)
      when(:tags)
        build_tag_string value
      when(:accessType)
        format_access_type value
      else
        value
      end
    end

    def format_uri uri
      uri = 'http://' + uri unless uri[0..6] == 'http://'
      uri
    end

    def build_tag_string tags
      if tags.class == Array
        tags.collect{|a| a + ", "}.to_s.chop.chop
      else
        tags
      end
    end

    def format_access_type type
      type == :private ? 0 : 1
    end

    def add key, value
      @params[key] = value
    end

    def title title
      add :title, title
    end

    def href uri
      add :href, uri
    end

    def tags tags
      add :tags, tags
    end

    def access_type type
      add :accessType, type
    end

    def url_nickname nickname
      add :urlNickname, nickname
    end

    def note note
      add :note, note
    end

    def q query
      add :q, query
    end

    def limit limit
      add :limit, limit
    end

    def date date, to=nil
      if to
        add :afterDate, format_date(date)
        add :beforeDate, format_date(to)
      else
        add :date, format_date(date)
      end

    end

    def format_date date
      date.strftime("%Y-%m-%d")
    end
  end
end