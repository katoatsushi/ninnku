class CreateCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
    	t.string :company_name
    	t.string :company_bill
    	t.text   :company_addr
    	t.integer :company_phone_number
    	t.integer :company_fax
      
      t.integer :company_work_time
  		t.integer :company_break_time
  		t.integer :company_overtime_work
  		t.integer :company_closing_date


      t.timestamps
    end
  end
end
