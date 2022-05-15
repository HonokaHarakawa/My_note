class CreateGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :goals do |t|
      
      t.integer :user_id
      t.string :goal
      t.date :deadline
      t.integer :target_amount
      t.timestamps
    end
  end
end
