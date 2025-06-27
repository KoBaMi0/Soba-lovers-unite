class AddAvatarToPost < ActiveRecord::Migration[7.2]
  def change
    add_column :posts, :avatar, :string
  end
end
