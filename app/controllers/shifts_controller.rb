class ShiftsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  def shift_alerts
    @bad_shifts = Shift.collect_bad_shifts
  end

  def dismiss
    id = params[:id]
    shift = Shift.find(id)
    shift.update(alert_admin: false)

    respond_to do |format|
      #format.html { redirect_to shift_alerts_path(params[:district_id]) }
      format.json { head :no_content }
      #format.js   { render :layout => false }
    end
  end
end
