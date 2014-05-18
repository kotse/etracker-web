class TagColor < ActiveRecord::Base
	validates :color_hex, presence: true
end
