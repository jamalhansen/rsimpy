# encoding: utf-8

# user.rb : Encapsulates Simpy user account information
#
# Copyright April 2009, Jamal Hansen. All Rights Reserved.
#
# This is free software. Please see the LICENSE files for details.
module RSimpy
  # The RSimpy::User class encapsulates user information.
  #
  # You can instanciate it with a has containing login and password
  #
  # For example:
  #
  # user = RSimpy::User.new :user => 'example', :pass => '1234'
  #
  # Or you can use a block:
  #
  # user = RSimpy::User.new do
  # login :example
  # pass :1234
  # end
  class User
    attr_reader :username, :password

    def initialize params={}, &block
      @username = params[:login]
      @password = params[:pass]

      if block
         instance_eval(&block)
      end
    end

    def login name
      @username = name.to_s
    end

    def pass pass
      @password = pass.to_s
    end
  end
end