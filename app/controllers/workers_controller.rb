class WorkersController < ApplicationController
  def new
    @worker = Worker.new
  end

  def show
    id = params[:id]
    @worker = Worker.find(id)
  end

  def create
    @worker = Worker.new(worker_params)
    if @worker.save
      redirect_to worker_path(@worker)
    else
      render "new"
    end
  end

  private

  def worker_params
    params.require(:worker).permit(:first_name, :last_name, :primary_phone)
  end  
end
