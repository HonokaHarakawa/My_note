class RemoveMemoFromSpendings < ActiveRecord::Migration[5.2]
  def change
    remove_column :spendings, :memo, :string
  end
end
