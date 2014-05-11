class Expense < ActiveRecord::Base
	belongs_to :user
	belongs_to :asset
	has_and_belongs_to_many :tags

	validates :user_id, presence: true
	validates :asset_id, presence: true
	validates :amount, presence: true
end
