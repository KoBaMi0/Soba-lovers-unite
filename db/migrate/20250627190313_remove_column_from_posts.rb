class RemoveColumnFromPosts < ActiveRecord::Migration[7.2]
  def change
    remove_column :posts, :photo, :string
  end
end
