class RemoveIncomeCategoryFromIncomes < ActiveRecord::Migration[5.2]
  def change
    remove_column :incomes, :income_category, :string
  end
end
