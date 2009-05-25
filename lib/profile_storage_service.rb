module RSimpy
  class  ProfileStorageService                                       
    def initialize location=nil
      @location = location || default_location
    end

    def default_location
      File.expand_path(File.join(['~','.rsimpy']))
    end

    def stored?
      File.exists? @location
    end

    def save user
      require 'khayyam'

      topic = Khayyam::Topic.new "rsimpy"
      topic.regarding "user" do |items|
        login, pass = user.credentials
        items["login"] = login
        items["pass"] = pass
      end

      output = topic.export

      file = File.open(@location, 'w+')
      file.write(output)
      file.close
    end

    def get
      file =  File.read(@location)
      data = {}
      require 'khayyam'
      login, pass = nil

      topic = Khayyam::Topic.import file
      topic.regarding "user" do |items|
        login = items["login"]
        pass = items["pass"]
      end

      return RSimpy::User.new(login, pass)
    end
  end
end 