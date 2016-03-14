class AddMinToShift < ActiveRecord::Migration
  def change
    add_column :shifts, :shift_minutes, :float
  end
end
