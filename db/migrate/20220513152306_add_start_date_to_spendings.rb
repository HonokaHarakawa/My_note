class AddStartDateToSpendings < ActiveRecord::Migration[5.2]
  def change
    add_column :spendings, :start_date, :datetime
  end
end
