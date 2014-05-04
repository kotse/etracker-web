class AddAssetIdToExpenses < ActiveRecord::Migration
  def change
    add_reference :expenses, :asset, index: true
  end
end
