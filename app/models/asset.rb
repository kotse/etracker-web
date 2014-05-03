class Asset < ActiveRecord::Base
	belongs_to :user

	enum asset_type: [:debit, :credit, :cash, :voucher, :other]

	after_initialize :set_default_asset_type, :if => :new_record?

    def set_default_asset_type
      self.asset_type ||= :debit
    end

	validates :user_id, presence: true
	validates :asset_type, presence: true
	validates :amount, presence: true
end
