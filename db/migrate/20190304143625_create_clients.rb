class CreateClients < ActiveRecord::Migration[5.1]
  def change
    create_table :clients do |t|
      t.string :client_name
      t.string :client_addr
      t.string :client_bill
      t.integer :client_phone_number
      t.integer :client_fax

      t.integer :company_id

      t.timestamps
    end
  end
end
