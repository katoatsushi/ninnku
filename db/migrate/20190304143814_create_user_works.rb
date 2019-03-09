class CreateUserWorks < ActiveRecord::Migration[5.1]
  def change
    create_table :user_works do |t|
      #t.string :work_element
      t.integer :client_work_id
      t.integer :work_salary
      t.integer :work_overtime_salary
      t.integer :user_id
      

      t.timestamps
    end
  end
end
