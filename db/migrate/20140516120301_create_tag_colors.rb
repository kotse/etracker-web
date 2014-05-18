class CreateTagColors < ActiveRecord::Migration
  def change
    create_table :tag_colors do |t|
      t.string :name
      t.string :color_hex

      t.timestamps
    end
  end
end
