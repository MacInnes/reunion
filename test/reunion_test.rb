require 'minitest'
require 'minitest/test'
require 'minitest/autorun'
require './lib/reunion'
require './lib/activity'

class ReunionTest < Minitest::Test

  def test_has_attributes
    golf = Activity.new("Golf", 200, 50)
    swimming = Activity.new("Swimming", 5, 5)

    reunion = Reunion.new("Boulder", [golf, swimming])

    assert_equal "Boulder", reunion.location
    assert_equal 2, reunion.activities.length
  end

  def test_can_add_activities
    golf = Activity.new("Golf", 200, 50)
    swimming = Activity.new("Swimming", 5, 5)

    reunion = Reunion.new("Boulder", [golf, swimming])

    hiking = Activity.new("Hiking", 25, 20)

    reunion.add_activity(hiking)

    assert_equal 3, reunion.activities.length
  end

end
