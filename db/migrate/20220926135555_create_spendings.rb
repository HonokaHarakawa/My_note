class CreateSpendings < ActiveRecord::Migration[5.2]
  def change
    create_table :spendings do |t|

      t.integer :user_id
      t.integer :spending_amount
      t.integer :genre_id
      t.string :memo
      t.datetime :start_time

      t.timestamps
    end
  end
end
