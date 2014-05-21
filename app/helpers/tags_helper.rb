module TagsHelper

	def color_options
		options = []
		TagColor.all.each do |tag_color|
			options.push ["", tag_color.color_hex, {style: "background-color: #{tag_color.color_hex}"}]
		end

		options
	end
end
