class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.string :asset_type
      t.string :description
      t.integer :amount
      t.integer :user_id

      t.timestamps
    end

    add_index :assets, [:user_id]
  end
end
