class AddServicePlantoClient < ActiveRecord::Migration
  def change
    add_column :clients, :max_monthly_minutes, :float, default: 9600.0
    add_column :workers, :max_weekly_minutes, :float, default: 2400.0
  end
end
