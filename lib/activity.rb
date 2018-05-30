class Activity

  attr_reader :name,
              :base_cost,
              :participants,
              :cost_per_participant

  def initialize(name, base_cost, cost_per_participant)
    @name = name
    @base_cost = base_cost
    @participants = []
    @cost_per_participant = cost_per_participant
  end

  def add_participant(name, amt_paid)
    participant = {
      :name => name,
      :paid => amt_paid
    }
    @participants << participant
  end

  def total_cost
    @base_cost + @cost_per_participant * @participants.length
  end

  def fair_share
    total_cost / @participants.length
  end

  def amount_owed
    output = {}
    @participants.each do |participant|
      output[participant[:name]] = fair_share - participant[:paid]
    end
    output
  end

end
