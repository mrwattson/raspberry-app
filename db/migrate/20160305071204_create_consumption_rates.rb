class CreateConsumptionRates < ActiveRecord::Migration
  def change
    create_table :consumption_rates do |t|
      t.integer :min_contracted_power
      t.integer :max_contracted_power
      t.integer :min
      t.integer :max
      t.float :kwatt_cost

      t.timestamps null: false
    end
  end
end
