class RemoveTargetAmountFromGoals < ActiveRecord::Migration[5.2]
  def change
    remove_column :goals, :target_amount, :integer
  end
end
