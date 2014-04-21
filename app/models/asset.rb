class Asset < ActiveRecord::Base
	validates :user_id, presence: true
	validates :asset_type, presence: true
	validates :amount, presence: true
end
