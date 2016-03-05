module CostCalculations
  extend ActiveSupport::Concern

  included do
    def kwatts_to_cost(kwatts)
      {
        name: plan.name,
        calculated_kwatts_cost: (kwatts * kwatt_cost).to_s[0..3]
      }
    end
  end
end
