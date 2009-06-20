require 'errors/required_field_missing_error'

class RequiredFieldMissingErrorTest < Test::Unit::TestCase
    def test_can_get_field
      begin
        raise RSimpy::RequiredFieldMissingError.new "foo"
      rescue RSimpy::RequiredFieldMissingError => e
        assert_equal "foo", e.field
      end
    end
end
