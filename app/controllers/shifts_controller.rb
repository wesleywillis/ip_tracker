class ShiftsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  def shift_alerts
    @bad_shifts = Shift.collect_bad_shifts
  end

  def dismiss
    id = params[:id]
    Shift.find(id).update(alert_admin: false)
    respond_to do |format|
      format.json { head :no_content }
    end
  end
end
