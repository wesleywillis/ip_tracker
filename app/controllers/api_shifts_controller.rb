class ApiShiftsController < ApplicationController
  def bad_shifts
    render json: {count: 78}
  end
end
