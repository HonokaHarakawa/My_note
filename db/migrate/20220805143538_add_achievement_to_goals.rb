class AddAchievementToGoals < ActiveRecord::Migration[5.2]
  def change
    add_column :goals, :achievement, :boolean, default: false, null: false
  end
end
