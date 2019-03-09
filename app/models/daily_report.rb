class DailyReport < ApplicationRecord
	belongs_to :user
	has_many :expenses
	has_one :client
	has_one :client_work
end
