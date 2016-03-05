class CreateTimeRanges < ActiveRecord::Migration
  def change
    create_table :time_ranges do |t|
      t.string :description
      t.boolean :summer_time
      t.integer :start_hour
      t.integer :end_hour
      t.float :kwatt_cost

      t.timestamps null: false
    end
  end
end
