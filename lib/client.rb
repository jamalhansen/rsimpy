module RSimpy
  class Client                                           
    include HTTParty                                       
    base_uri 'www.simpy.com/simpy/api/rest'                
    format :xml

    def initialize(user)
      self.class.basic_auth user.username, user.pass
    end

    def get action
      begin
	self.class.get action
      rescue SocketError => error
	raise ConnectionError.new "Error connecting to Simpy: #{error.message}"
      end
    end

  end  

  class ConnectionError < RuntimeError; end
end 