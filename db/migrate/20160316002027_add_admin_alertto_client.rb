class AddAdminAlerttoClient < ActiveRecord::Migration
  def change
    add_column :clients, :alert_admin, :boolean, default: false
  end
end
