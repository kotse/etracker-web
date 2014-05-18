 class PopulateTagColors
  def call
	TagColor.delete_all

	TagColor.create name: "default 1", color_hex: "#FF0033"
	TagColor.create name: "default 2", color_hex: "#990000"
	TagColor.create name: "default 3", color_hex: "#FF6699"
	TagColor.create name: "default 4", color_hex: "#FFD300"
	TagColor.create name: "default 5", color_hex: "#A68900"
	TagColor.create name: "default 6", color_hex: "#FFE773"
	TagColor.create name: "default 7", color_hex: "#3914AF"
	TagColor.create name: "default 8", color_hex: "#200772"
	TagColor.create name: "default 9", color_hex: "#876ED7"
	TagColor.create name: "default 10", color_hex: "#00CC00"
	TagColor.create name: "default 11", color_hex: "#008500"
	TagColor.create name: "default 12", color_hex: "#67E667"

	TagColor.all
  end
end
