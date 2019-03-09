class CreateClientWorks < ActiveRecord::Migration[5.1]
  def change
    create_table :client_works do |t|
      t.string :work_place
      t.string :work_name
      t.integer :salary_per_man
      t.integer :client_id

      t.timestamps
    end
  end
end
