class RemoveAlertTableFromShift < ActiveRecord::Migration
  def change
    remove_column :shifts, :alert_table, :boolean
  end
end
