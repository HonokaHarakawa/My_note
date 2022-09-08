class RenameUserColumnToPosts < ActiveRecord::Migration[5.2]
  def change
    rename_column :posts, :user, :user_id
  end
end
