class CreateDailyReports < ActiveRecord::Migration[5.1]
  def change
    create_table :daily_reports do |t|
      #日付け
      t.date :work_date
      #客先名
      t.integer :client_id
      #現場名
      t.integer :client_work_id
      #勤務開始時間
      t.datetime :start_work_time
      #勤務終了時間
      t.datetime :finish_work_time

      t.integer :user_id

      t.timestamps
    end
  end
end
