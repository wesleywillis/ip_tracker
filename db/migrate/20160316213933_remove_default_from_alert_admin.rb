class RemoveDefaultFromAlertAdmin < ActiveRecord::Migration
  def change
    add_column :clients, :alert_admin, :boolean
  end
end
