class ClientsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
    @district = params[:district_id]
    @all_clients = Client.all
  end

  def dormant
    @dormant_cases = Client.dormant_cases
  end

  def dismiss_alert
    id = params[:client_id]
    Client.find(id).update(alert_admin: false)

    respond_to do |format|
      format.json { head :no_content }
    end
  end

  def new
    @client = Client.new
    @all_workers = Worker.all
  end

  def show
    @district = params[:district_id]
    id = params[:id]
    @client = Client.find(id)
  end

  def create
    @client = Client.new(client_params)
    @all_workers = Worker.all
    if @client.save
      update_workers(@client)
      redirect_to district_client_path(params[:district_id], @client)
    else
      render "new"
    end
  end

  def edit
    id = params[:id]
    @client = Client.find(id)
    @all_workers = Worker.all
  end

  def update
    id = params[:id]
    @client = Client.find(id)
    @client.update(client_params)
    update_workers(@client)
    if @client.save
      redirect_to district_client_path(params[:district_id], @client)
    else
      @all_workers = Worker.all
      render "edit"
    end
  end



  private

  def client_params
    params.require(:client).permit(:first_name, :last_name, :primary_phone, :address, :city, :state)
  end

  def update_workers(client)
    if !params[:workers].nil?
      workers_array = params[:workers]
      client.workers = []
      workers_array.each do |worker|
        client.workers << Worker.find(worker)
      end
    end
  end
end
