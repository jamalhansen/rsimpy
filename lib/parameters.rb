module RSimpy
  class Parameters
    def initialize params={}
      @params = params
    end

    def [] key
      @params[key]
    end
  end
end