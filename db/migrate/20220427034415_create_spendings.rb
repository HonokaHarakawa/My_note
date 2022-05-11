class CreateSpendings < ActiveRecord::Migration[5.2]
  def change
    create_table :spendings do |t|
      
      t.integer :user_id
      t.string :spending_amount
      t.timestamps
    end
  end
end
