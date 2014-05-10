class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :user_id
      t.string :integer
      t.string :color
      t.string :name

      t.timestamps
    end

    add_index :tags, [:user_id]
  end
end
