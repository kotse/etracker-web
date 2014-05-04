class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.integer :user_id
      t.integer :asset_id
      t.integer :amount
      t.string :description

      t.timestamps
    end

    add_index :expenses, [:user_id]
  end
end
