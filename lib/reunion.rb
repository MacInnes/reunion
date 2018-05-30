class Reunion
  attr_reader :location,
              :activities

  def initialize(location, activities = [])
    @location = location
    @activities = activities
  end

  def add_activity(activity)
    @activities << activity
  end

  def total_cost
    @activities.reduce(0) do |total, activity|
      total += activity.total_cost
      total
    end
  end

  def total_amount_owed_per_participant
    owed_array = @activities.map do |activity|
      activity.amount_owed
    end
    owed_array.reduce({}) do |collector, current|
      current.each do |key, value|
        if collector[key]
          collector[key] += value
        else
          collector[key] = value
        end
      end
      collector
    end
  end

  def print_summary
    puts total_amount_owed_per_participant
    total_amount_owed_per_participant # added this just to test for output...  tho it was already tested above...?  idk
  end

end
