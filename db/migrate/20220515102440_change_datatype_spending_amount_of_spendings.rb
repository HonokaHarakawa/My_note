class ChangeDatatypeSpendingAmountOfSpendings < ActiveRecord::Migration[5.2]
  def change
    change_column :spendings, :spending_amount, :integer
  end
end
