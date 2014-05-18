module TagsHelper

	def color_options
# , {class: "someclass"}
		options = []
		12.times do |index|
			options.push ["", "ff00ff", {class: "palette-#{index+1}"}]
		end

		options
	end
end
