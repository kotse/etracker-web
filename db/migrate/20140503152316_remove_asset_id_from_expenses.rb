class RemoveAssetIdFromExpenses < ActiveRecord::Migration
  def change
    remove_column :expenses, :asset_id, :integer
  end
end
