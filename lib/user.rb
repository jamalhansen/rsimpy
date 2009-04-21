module RSimpy
  class User
    attr_reader :username, :pass

    def initialize(user, pass)
      @username = user
      @pass = pass
    end
  end
end