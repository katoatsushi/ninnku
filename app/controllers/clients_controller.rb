class ClientsController < ApplicationController
  def new
    @client = Client.new()
  end

  def create
    @client = Client.new(client_params)
    @client.company_id = 1
    if @client.save
      redirect_to  new_client_client_work_path(client_id: @client.id)
    else
      redirect_to root_path
    end
  end

  def index
    @clients = Client.all
  end

  def show
    @client = Client.find(params[:id])
  end

  def edit
  end

  def delete
  end

  private

  def client_params
    params.require(:client).permit(:client_name,:client_addr,:client_bill,:client_phone_number,:client_fax,:company_id)
  end
end
