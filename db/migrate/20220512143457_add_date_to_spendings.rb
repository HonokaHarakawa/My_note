class AddDateToSpendings < ActiveRecord::Migration[5.2]
  def change
    add_column :spendings, :date, :date
  end
end
