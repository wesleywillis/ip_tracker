class ApiShiftsController < ApplicationController
  def bad_shifts
    render json: {count: 7}
  end
end
