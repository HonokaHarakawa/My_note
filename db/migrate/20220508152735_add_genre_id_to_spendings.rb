class AddGenreIdToSpendings < ActiveRecord::Migration[5.2]
  def change
    add_column :spendings, :genre_id, :integer
  end
end
