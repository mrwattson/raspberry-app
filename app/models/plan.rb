class Plan < ActiveRecord::Base
  has_many :consumption_rates, dependent: :destroy
  has_many :time_ranges, dependent: :destroy

  def kwatts_to_cost(kwatts)
    costs = []

    consumption_rates.each do |consumption_rate|
      costs << consumption_rate.kwatts_to_cost(kwatts)
    end

    time_ranges.map do |time_range|
      costs << time_range.kwatts_to_cost(kwatts)
    end

    costs
  end

  def consumption_rates?
    consumption_rates.size > 0
  end

  def time_ranges?
    time_ranges.size > 0
  end
end
