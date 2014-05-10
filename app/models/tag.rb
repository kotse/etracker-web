class Tag < ActiveRecord::Base
	belongs_to :user

	after_initialize :set_default_color, :if => :new_record?

    def set_default_color
      self.color ||= :"0000FF"
    end

	validates :user_id, presence: true
	validates :name, presence: true
end