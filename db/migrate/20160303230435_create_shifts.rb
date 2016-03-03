class CreateShifts < ActiveRecord::Migration
  def change
    create_table :shifts do |t|
      t.integer :care_pair_id
      t.string :start_gps
      t.boolean :start_range
      t.string :stop_time
      t.string :stop_gps
      t.boolean :stop_range
      t.boolean :final_range

      t.timestamps null: false
    end
  end
end
