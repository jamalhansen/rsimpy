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

    def save data
      require 'khayyam'

      topic = Khayyam::Topic.new "rsimpy"
      topic.regarding "user" do |items|
        items["username"] = data[:user].username
        items["password"] = data[:user].password
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

      topic = Khayyam::Topic.import file
      topic.regarding "user" do |items|
        data[:username] = items["username"]
        data[:password] = items["password"]
      end

      output = topic.export
      return {:user => RSimpy::User.new(data)}
    end
  end
end 