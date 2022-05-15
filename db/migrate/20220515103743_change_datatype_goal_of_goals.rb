class ChangeDatatypeGoalOfGoals < ActiveRecord::Migration[5.2]
  def change
    change_column :goals, :goal, :text
  end
end
