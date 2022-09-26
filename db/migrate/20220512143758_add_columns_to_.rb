class AddColumnsTo < ActiveRecord::Migration[5.2]

  def change
    add_column :spendings, :memo, :string
  end
end
