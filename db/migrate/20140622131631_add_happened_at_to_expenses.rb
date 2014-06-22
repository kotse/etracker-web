class AddHappenedAtToExpenses < ActiveRecord::Migration
  def change
    add_column :expenses, :happened_at, :datetime

    reversible do |dir|
      dir.up do
        #transfer data from created_at to happened_at
        Expense.all.each do |expense|
          expense.update happened_at: expense.created_at
        end
      end
    end
  end
end
