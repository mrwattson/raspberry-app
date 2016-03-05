class AddForeignKeysForPlanConsumptionRateTimeRanges < ActiveRecord::Migration
  def change
    add_column :consumption_rates, :plan_id, :integer
    add_index :consumption_rates, :plan_id

    add_column :time_ranges, :plan_id, :integer
    add_index :time_ranges, :plan_id
  end
end
