require 'cgi'

module RSimpy
  class Parameters
    def initialize params={}
      @params = params
    end

    def [] key
      @params[key]
    end

    def to_querystring
      output = ""

      @params.each do |key, value|
	value = CGI.escape(value) if value.class == String
	output << "#{key.to_s}=#{value}&"
      end

      output.chop
    end

    def add key, value
      @params[key] = value
    end
  end
end