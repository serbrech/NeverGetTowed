require 'test_helper'

# To load test database with test data:
#    rake RAILS_ENV=test db:migrate
#    rake RAILS_ENV=test scrape_snow_removal
#
# To run tests:
#    ruby -Itest test/unit/street_test.rb
class StreetTest < ActiveSupport::TestCase

  test "the truth" do
    street = Street.new()
    street.streetname = "Dovresvingen"

    binding.pry
    assert true
  end

end
