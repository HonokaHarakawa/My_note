class ChangeDataStartTimeToSpendings < ActiveRecord::Migration[5.2]
  def change
    change_column :spendings, :start_time, :date
  end
end
