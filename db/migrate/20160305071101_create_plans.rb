class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string :name
      t.integer :min_contracted_power
      t.integer :max_contracted_power
      t.float :contracted_power_extra_cost
      t.float :fixed_monthly_cost
      t.integer :max_consumption_for_special_fixed_monthly_cost

      t.timestamps null: false
    end
  end
end
