class ClientWorksController < ApplicationController
  def new
    @client_work = ClientWork.new()
  end

  def create
    @client_work = ClientWork.create(client_work_params)
    @client_work.client_id = params[:client_id].to_i
    if @client_work.save
      redirect_to  client_path(id: @client_work.client_id)
    else
      redirect_to root_path
    end
  end

  def edit
  end

  def update
  end

  def delete
  end

  def show
  end

  def index

  end

  private

  def client_work_params
    params.require(:client_work).permit(:work_place,:work_name,:salary_per_man,:client_id)
  end
end
