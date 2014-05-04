class Expense < ActiveRecord::Base
	belongs_to :user
	belongs_to :asset

	validates :user_id, presence: true
	validates :asset_id, presence: true
	validates :amount, presence: true
end
