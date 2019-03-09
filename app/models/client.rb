class Client < ApplicationRecord
	belongs_to :company
	#belongs_to :daily_report
	has_many :client_works
end
