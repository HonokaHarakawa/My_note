class RemoveSpendingCategoryFromSpendings < ActiveRecord::Migration[5.2]
  def change
    remove_column :spendings, :spending_category, :string
  end
end
