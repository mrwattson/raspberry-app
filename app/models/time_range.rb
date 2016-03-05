class TimeRange < ActiveRecord::Base
  belongs_to :plan

  def kwatts_to_cost(kwatts)
    {
      name: plan.name,
      start_hour: start_hour,
      end_hour: end_hour,
      calculated_kwatts_cost: (kwatts * kwatt_cost).to_s[0..3]
    }
  end
end
