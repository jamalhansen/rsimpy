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

  class User
    def initialize login, pass
      @login = login
      @pass = pass
    end

    def credentials
      [@login, @pass]
    end

    def valid?
      @login && @pass
    end
  end
end