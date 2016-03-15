class ShiftsController < ApplicationController

  def shift_alerts
    @bad_shifts = Shift.collect_bad_shifts
  end

  def update

  end
end
