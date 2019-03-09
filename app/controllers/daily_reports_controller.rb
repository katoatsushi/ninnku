class DailyReportsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @arr ||= []
    @user.user_works.each do |uw|
      @arr << uw.client_work_id
    end
    @daily_report = DailyReport.new()
    #binding.pry
  end

  def create
    @daily_report = DailyReport.create(daily_report_params)
    @daily_report.user_id = params[:user_id]
    @daily_report.work_date = work_date
    @daily_report.start_work_time = start_work_time
    @daily_report.finish_work_time = finish_work_time
    @daily_report.client_id =  ClientWork.find(params[:daily_report][:client_work_id].to_i).client.id
    if @daily_report.save
      redirect_to root_path
    else
      new_user_daily_report_path(current_user.id)
    end
  end

  def edit
  end

  def delete
  end

  def update
  end

  def show
  end

  def index
  end

  private

    def work_date
        year = params[:daily_report]['work_date(1i)']#年
        month = params[:daily_report]['work_date(2i)']#月
        day = params[:daily_report]['work_date(3i)']#日
        # hour = params[:daily_work]['eventtim(4i)']#時
        # min = params[:daily_work]['eventtime(5i)']#分
        #返り値
        Date.new(year.to_i, month.to_i, day.to_i)
    end

    def start_work_time
        year = params[:daily_report]['start_work_time(1i)']
        month = params[:daily_report]['start_work_time(2i)']
        day = params[:daily_report]['start_work_time(3i)']
        hour = params[:daily_report]['start_work_time(4i)']#時
        min = params[:daily_report]['start_work_time(5i)']#分
        DateTime.new(year.to_i,month.to_i,day.to_i,hour.to_i,min.to_i)
    end
    def finish_work_time
        year = params[:daily_report]['finish_work_time(1i)']
        month = params[:daily_report]['finish_work_time(2i)']
        day = params[:daily_report]['finish_work_time(3i)']
        hour = params[:daily_report]['finish_work_time(4i)']#時
        min = params[:daily_report]['finish_work_timi)']#分
        DateTime.new(year.to_i,month.to_i,day.to_i,hour.to_i, min.to_i)
    end

  def daily_report_params
    params.require(:daily_report).permit(:work_date,:client_id,:client_work_id,:start_work_time,:finish_work_time,:user_id)
  end
end
