class CreateReadings < ActiveRecord::Migration
  def change
    create_table :readings do |t|
      t.float :raw

      t.timestamps null: false
    end
  end
end
