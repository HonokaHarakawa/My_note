class RemoveSpendingGenreIdFromGenres < ActiveRecord::Migration[5.2]
  def change
    remove_column :genres, :spending_genre_id, :integer
  end
end
