class WorkersController < ApplicationController
  def new
    @worker = Worker.new
    @all_clients = Client.all
  end

  def show
    id = params[:id]
    @worker = Worker.find(id)
  end

  def create
    @worker = Worker.new(worker_params)
    @all_clients = Client.all
    if @worker.save
      update_clients(@worker)
      redirect_to district_worker_path(params[:district_id], @worker)
    else
      render "new"
    end
  end

  def edit
    id = params[:id]
    @worker = Worker.find(id)
    @all_clients = Client.all
  end

  def update
    id = params[:id]
    @worker = Worker.find(id)
    @worker.update(worker_params)
    update_clients(@worker)
    if @worker.save
      redirect_to district_worker_path(params[:district_id], @worker)
    else
      @all_clients = Client.all
      render "edit"
    end
  end

  private

  def worker_params
    params.require(:worker).permit(:first_name, :last_name, :primary_phone)
  end

  def update_clients(worker)
    if !params[:clients].nil?
      clients_array = params[:clients]
      worker.clients = []
      clients_array.each do |client|
        worker.clients << Client.find(client)
      end
    end
  end
end
