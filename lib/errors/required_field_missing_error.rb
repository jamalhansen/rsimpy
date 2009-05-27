# To change this template, choose Tools | Templates
# and open the template in the editor.

module RSimpy
  class RequiredFieldMissingError < RuntimeError
    attr_reader :field

    def initialize field
      @field = field
    end
  end
end
