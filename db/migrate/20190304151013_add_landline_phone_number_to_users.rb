class AddLandlinePhoneNumberToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :landline_phone_number, :integer
  end
end
