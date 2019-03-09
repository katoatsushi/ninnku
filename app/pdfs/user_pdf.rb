# app/pdfs/order_pdf.rb
class UserPDF < Prawn::Document

  def initialize(user)
    super()
    @user = user
    font "vendor/fonts/ipaexg.ttf"
    @closing_date = Company.find(1).company_closing_date

    # if Time.now.day < @closing_date
    #   @start_date = Time.new( Time.now.year, Time.now.month, @closing_date)
    # else
    #   @start_date = Time.new( Time.now.year, Time.now.month+1, @closing_date)
    # end
    @start_date = Time.new( Time.now.year, Time.now.month, @closing_date)

    @daily_reports_last_month_bill = DailyReport.where(user_id: @user.id,work_date: @start_date.prev_month..@start_date)
    @the_month = @start_date.month-1

    if Time.now > @start_date
      #3/29(今日) > 3/25(締め日)の時
      @daily_reports =  DailyReport.where('work_date > ?', @start_date).where(user_id: @user.id)
      @month = @start_date.month
      #@daily_reports_last_month = @daily_reports = DailyReport.where('work_date > ?', @start_date.prev_month)
    elsif Time.now <= @start_date
      @daily_reports = DailyReport.where('work_date > ?', @start_date.prev_month).where(user_id: @user.id)
      @month = @start_date.month
      #@daily_reports_last_month = @daily_reports = DailyReport.where('work_date > ?', @start_date.months_ago(2))
    end

    user_bill(@daily_reports, @month)
    start_new_page
    user_bill(@daily_reports_last_month_bill, @the_month)
     
  end


  def closing_time

  end
  
  
  def user_bill(reports , month)
    text "#{month}月"
    @user_works = @user.user_works
    @cost_all = 0
    #作業場の時間外労働の時給
    reports.each do |dr|
    #作業日報でに記載されてつ作業場
    @user_work = UserWork.where(user_id: @user.id, client_work_id: dr.client_work_id).first
    text "#{dr.work_date.to_s}  の給料明細"
    text "作業内容    #{ClientWork.find(@user_work.client_work_id).work_name}"
    text "基本給は    #{@user_work.work_salary}"
    text "残業代/時は   #{@user_work.work_overtime_salary}"
    # 作業時間の計算
    start = dr.start_work_time
    fin = dr.finish_work_time
    a = (fin-start)/60/60
    c_w_t = Company.find(1).company_work_time
    sum_of_overtime_work = 0
    if a > c_w_t
     sum_of_overtime_work =  a - c_w_t.to_f
    end
    text "総労働時間は    #{a}"
    text  "時間外労働は    #{sum_of_overtime_work}"
    #ここまで
    over_cost = sum_of_overtime_work*@user_work.work_overtime_salary
    text "時間外労働に伴う残業代は    #{over_cost}"
    cost_all = over_cost + @user_work.work_salary
    text "総額   #{cost_all}円"
    @cost_all +=  cost_all
  end
  text "計　　　　　#{@cost_all}"
end

  def user_test
    text "#{Time.now.month}月"
    @user_works = @user.user_works
    #作業場の時間外労働の時給

    @daily_reports.each do |dr|
    #作業日報でに記載されてつ作業場
    @user_work = UserWork.where(user_id: @user.id, client_work_id: dr.client_work_id).first
    text "#{dr.work_date.to_s}  の給料明細"
    text "作業内容    #{@user_work.work_element}"
    text "基本給は    #{@user_work.work_salary}"
    text "残業代/時は   #{@user_work.work_overtime_salary}"
    # 作業時間の計算
    start = dr.start_work_time
    fin = dr.finish_work_time
    a = (fin-start)/60/60
    c_w_t = Company.find(1).company_work_time
    sum_of_overtime_work = 0
    if a > c_w_t
     sum_of_overtime_work =  a - c_w_t.to_f
    end
    text "総労働時間は    #{a}"
    text  "時間外労働は    #{sum_of_overtime_work}"
    #ここまで
    over_cost = sum_of_overtime_work*@user_work.work_overtime_salary
    text "時間外労働に伴う残業代は    #{over_cost}"
    @cost_all = over_cost + @user_work.work_salary
    text "総額   #{@cost_all}円"
  end
end

  # def header
  #   # size 28 で "Order"という文字を表示
  #   text "Order", size: 28

  #   # stroke(線)の色を設定し、線を引く
  #   stroke_color "eeeeee"
  #   stroke_line [0, 680], [530, 680]
  # end

  # def header_lead
  #   # カーソルを指定
  #   y_position = cursor - 30

  #   # bounding_boxで記載箇所を指定して、textメソッドでテキストを記載
  #   bounding_box([100, y_position], :width => 270, :height => 50) do
  #     font_size 10.5
  #     text "注文番号:  #{@user.id}"
  #     move_down 3
  #     text "　注文日:  #{@order.purchased_at}"
  #   end
  # end

  # def table_content
  #   # tableメソッドは2次元配列を引数(line_item_rows)にとり、それをテーブルとして表示する
  #   # ブロック(do...end)内でテーブルの書式の設定をしている
  #   table line_item_rows do
  #     # 全体設定
  #     cells.padding = 8          # セルのpadding幅
  #     cells.borders = [:bottom,] # 表示するボーダーの向き(top, bottom, right, leftがある)
  #     cells.border_width = 0.5   # ボーダーの太さ

  #     # 個別設定
  #     # row(0) は0行目、row(-1) は最後の行を表す
  #     row(0).border_width = 1.5
  #     row(-2).border_width = 1.5
  #     row(-1).background_color = "f0ad4e"
  #     row(-1).borders = []

  #     self.header     = true  # 1行目をヘッダーとするか否か
  #     self.row_colors = ['dddddd', 'ffffff'] # 列の色
  #     self.column_widths = [50, 200, 100, 70, 100] # 列の幅
  #   end
  # end

  # # テーブルに表示するデータを作成(2次元配列)
  # def line_item_rows
  #   # テーブルのヘッダ部
  #   arr = [["#", "品名", "単価", "数量", "値段"]]

  #   # テーブルのデータ部
  #   @order.line_items.map.with_index do |item, i|
  #     arr << [i+1, item.product_name, item.price, item.quantity, item.total_price]
  #   end

  #   # テーブルの合計部
  #   arr << ["", "", "", "合計", @order.total_price]
  #   return arr
  # end
end