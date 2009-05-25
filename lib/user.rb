# encoding: utf-8

# user.rb : Encapsulates Simpy user account information
#
# Copyright April 2009, Jamal Hansen. All Rights Reserved.
#
# This is free software. Please see the LICENSE files for details.
module RSimpy
  # The RSimpy::User class encapsulates user information.
  #
  # You can instanciate it with a hash containing login and password
  #
  # For example:
  #
  #   user = RSimpy::User.new 'login', 'password'
  #
  # Or you can use a block:
  #
  #   user = RSimpy::User.build do
  #     login :example
  #     pass :1234
  #   end
  #
  # When using build you have the ability to read the login and password from a config file.
  class User
    def initialize login, pass
      @login = login
      @pass = pass
    end

    def credentials
      [@login, @pass]
    end

    def self.login name
      @login = name.to_s
    end

    def self.pass pass
      @pass = pass.to_s
    end    
    
    def self.build &block
      class_eval(&block)
      self.build_user 
    end
    
    protected
      def self.get_configuration
        storage_service = RSimpy::ProfileStorageService.new
        config = RSimpy::Configuration.new storage_service

        if !config.stored?
          raise RuntimeError "Please configure RSimpy or supply username and password when creating a new instance of Facade."
        end

        config.get
      end

      def self.build_user
        if @login == nil || @pass == nil
          get_configuration
        else
          new @login, @pass
        end
      end
  end
end