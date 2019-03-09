class CreateExpenses < ActiveRecord::Migration[5.1]
  def change
    create_table :expenses do |t|
      t.integer :daily_report_id
      t.string :expense_detail
      t.integer :cost

      t.timestamps
    end
  end
end
