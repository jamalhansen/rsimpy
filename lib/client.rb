require 'errors/connection_error'

require 'rubygems'
gem 'httparty', '>= 0.4.2'
require 'httparty'


module RSimpy
  class Client                                           
    include HTTParty                                       
    base_uri 'www.simpy.com/simpy/api/rest'                
    format :xml

    def initialize(user)
      login, pass = user.credentials
      self.class.basic_auth login, pass
    end

    def execute method, uri
      case method
      when :get
        get uri
      when :post
        post uri
      end
    end

    def get uri
      begin
        self.class.get uri
      rescue SocketError => error
        raise ConnectionError.new "Error connecting to Simpy: #{error.message}"
      end
    end

    def post uri
      begin
        self.class.post uri
      rescue SocketError => error
        raise ConnectionError.new "Error connecting to Simpy: #{error.message}"
      end
    end
  end  
end 