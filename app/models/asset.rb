class Asset < ActiveRecord::Base
	belongs_to :user

	validates :user_id, presence: true
	validates :asset_type, presence: true
	validates :amount, presence: true
end
