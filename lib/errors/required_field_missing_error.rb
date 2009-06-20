module RSimpy
  class RequiredFieldMissingError < RuntimeError
    attr_reader :field

    def initialize field
      @field = field
    end
  end
end
