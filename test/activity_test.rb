require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'

class ActivityTest < Minitest::Test
  
  def test_activity_has_attributes
    activity = Activity.new("disc golf", 20, 5)

    assert_equal "disc golf", activity.name
    assert_equal 20, activity.base_cost
    assert_equal 5, activity.cost_per_participant
    assert_equal 0, activity.participants.length
  end

  def test_can_add_participants
    activity = Activity.new("disc golf", 20, 5)

    activity.add_participant("Andrew", 5)
    assert_equal 1, activity.participants.length
    assert_equal Hash, activity.participants[0].class
  end

  def test_can_calculate_total_cost
    activity = Activity.new("camping", 20, 10)

    activity.add_participant("Andrew", 20)
    activity.add_participant("JR", 20)
    activity.add_participant("Alex", 20)

    assert_equal 50, activity.total_cost 
  end

  def test_fair_share
    activity = Activity.new("camping", 20, 10)

    activity.add_participant("Andrew", 20)
    activity.add_participant("JR", 20)

    assert_equal 20, activity.fair_share
  end

  def test_amount_owed
    activity = Activity.new("camping", 20, 10)

    activity.add_participant("Andrew", 15)
    activity.add_participant("JR", 25)

    actual = activity.amount_owed
    expected = {"Andrew" => 5, "JR" => -5}

    assert_equal expected, actual

  end

end
