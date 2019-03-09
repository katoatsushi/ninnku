class UserWorksController < ApplicationController
  def new
    @user_work = UserWork.new()
    
  end

  def create
    @user_work = UserWork.create(user_work_params)
    @user_work.user_id = params[:user_id]
    if @user_work.save
      redirect_to root_path
    else
      new_user_user_work_path(user_id: params[:user_id])
    end

  end

  def edit
  end

  def delete
  end

  def index
  end

  def show
  end

  private

    def user_work_params
      params.require(:user_work).permit(:work_element,:work_salary,:work_overtime_salary,:user_id,:client_work_id)
    end
end
