class AddExtraFieldsForReadings < ActiveRecord::Migration
  def change
    add_column :readings, :device_id, :string
    add_column :readings, :request_time, :integer
    add_column :readings, :device_reading_created_at, :integer

    add_index :readings, :device_id
  end
end
