class AddAlertToShifts < ActiveRecord::Migration
  def change
    add_column :shifts, :alert_admin, :boolean, default: false
    add_column :shifts, :alert_table, :boolean
  end
end
