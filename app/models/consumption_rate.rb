class ConsumptionRate < ActiveRecord::Base
  belongs_to :plan

  def kwatts_to_cost(kwatts)
    {
      name: plan.name,
      min: min,
      max: max,
      calculated_kwatts_cost: (kwatts * kwatt_cost).to_s[0..3]
    }
  end
end
