module TagsHelper

	def color_options
		options = []
		TagColor.all.each do |tag_color|
			options.push ["default name", tag_color.color_hex]
			# , {style: "width: 100%"}
		end

		options
	end
end
