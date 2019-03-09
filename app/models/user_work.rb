class UserWork < ApplicationRecord
	belongs_to :user
	has_one :client_work
end
