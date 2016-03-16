class RemoveAlertsCol < ActiveRecord::Migration
  def change
    remove_column :clients, :alert_admin
  end
end
