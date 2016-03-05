plans = [
  {
    name: 'Tarifa residencial simple',
    min_contracted_power: 0,
    max_contracted_power: 40000,
    consumption_rates: [
      {
        min: 1,
        max: 100,
        kwatt_cost: 3.833,
      },
      {
        min: 101,
        max: 600,
        kwatt_cost: 5.007,
      },
      {
        min: 601,
        max: 99999,
        kwatt_cost: 5.945,
      }
    ],
    contracted_power_extra_cost: 47.6,
    fixed_monthly_cost: 148.3
  },
  {
    name: 'Tarifa doble horario residencial',
    min_contracted_power: nil,
    max_contracted_power: nil,
    contracted_power_extra_cost: 47.6,
    fixed_monthly_cost: 148.3,
    time_ranges: [
      {
        description: 'Punta',
        summer_time: false,
        start_hour: 17,
        end_hour: 23,
        kwatt_cost: 6.634
      },
      {
        description: 'Fuera de punta',
        summer_time: false,
        start_hour: 23,
        end_hour: 17,
        kwatt_cost: 2.594
      },
      {
        description: 'Punta',
        summer_time: true,
        start_hour: 18,
        end_hour: 24,
        kwatt_cost: 6.634
      },
      {
        description: 'Fuera de punta',
        summer_time: true,
        start_hour: 24,
        end_hour: 18,
        kwatt_cost: 2.594
      },
    ],
  },
  {
    name: 'Tarifa consumo basico residencial',
    min_contracted_power: 0,
    max_contracted_power: 3700,
    consumption_rates: [
      {
        min: 101,
        max: 140,
        kwatt_cost: 5.066,
      },
      {
        min: 141,
        max: 350,
        kwatt_cost: 9.296,
      },
      {
        min: 351,
        max: 99999,
        kwatt_cost: 5.945,
      }
    ],
    contracted_power_extra_cost: 0,
    fixed_monthly_cost: 245.6,
    max_consumption_for_special_fixed_monthly_cost: 100
  },
  {
    name: 'Tarifa consumo basico residencial',
    min_contracted_power: 0,
    max_contracted_power: 3700,
    consumption_rates: [
      {
        min: 101,
        max: 140,
        kwatt_cost: 5.066,
      },
      {
        min: 141,
        max: 350,
        kwatt_cost: 9.296,
      },
      {
        min: 351,
        max: 99999,
        kwatt_cost: 5.945,
      }
    ],
    contracted_power_extra_cost: 0,
    fixed_monthly_cost: 245.6,
    max_consumption_for_special_fixed_monthly_cost: 100
  },
]
plans.each do |plan_data|
  consumption_rates = plan_data[:consumption_rates] || []
  time_ranges = plan_data[:time_ranges] || []

  plan = Plan.new(plan_data.except(:consumption_rates, :time_ranges))
  plan.save

  consumption_rates.each do |consumption_rate_data|
    plan.consumption_rates << ConsumptionRate.create(consumption_rate_data)
  end

  time_ranges.each do |time_range|
    plan.time_ranges << TimeRange.create(time_range)
  end
end
