class AssetsEnum < ActiveRecord::Migration
  def change
  	change_column(:assets, :asset_type, :integer)
  end
end
