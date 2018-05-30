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

  def test_total_reunion_cost
    golf = Activity.new("Golf", 200, 50)
    swimming = Activity.new("Swimming", 5, 5)

    reunion = Reunion.new("Boulder", [golf, swimming])

    golf.add_participant("Andrew", 50)
    golf.add_participant("JR", 75)
    golf.add_participant("rich guy", 275)

    swimming.add_participant("Andrew", 5)
    swimming.add_participant("JR", 10)
    swimming.add_participant("rich guy", 10)

    actual = reunion.total_cost
    assert_equal 370, actual
  end

  def test_total_amount_owed_per_participant
    camping = Activity.new("Camping", 10, 10)
    bbq = Activity.new("BBQ", 20, 20)

    camping.add_participant("Andrew", 30)
    camping.add_participant("JR", 10)
    bbq.add_participant("Andrew", 30)
    bbq.add_participant("JR", 40)

    reunion = Reunion.new("Conifer", [camping, bbq])

    expected = {
      "Andrew" => -15,
      "JR" => -5
    }

    assert_equal expected, reunion.total_amount_owed_per_participant
  end

  def test_print_summary # this test is bad, and I should feel bad
    camping = Activity.new("Camping", 10, 10)
    bbq = Activity.new("BBQ", 20, 20)

    camping.add_participant("Andrew", 30)
    camping.add_participant("JR", 10)
    bbq.add_participant("Andrew", 30)
    bbq.add_participant("JR", 40)

    reunion = Reunion.new("Conifer", [camping, bbq])

    expected = {
      "Andrew" => -15,
      "JR" => -5
    }
    assert_equal expected, reunion.print_summary
  end

end
