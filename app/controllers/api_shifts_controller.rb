class ApiShiftsController < ApplicationController
  def bad_shifts
    shifts_array = Shift.collect_bad_shifts
    alert_num = shifts_array.length
    render json: {count: alert_num}
  end
end
