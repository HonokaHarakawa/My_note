class RenameStartTimeColumnToSpendings < ActiveRecord::Migration[5.2]
  def change
    rename_column :spendings, :start_date, :start_time
  end
end
