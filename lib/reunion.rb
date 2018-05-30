class Reunion
  attr_reader :location,
              :activities

  def initialize(location, activities)
    @location = location
    @activities = activities || []
  end

  def add_activity(activity)
    @activities << activity
  end

end
