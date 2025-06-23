class AddPosts < ActiveRecord::Migration[7.2]
  def change
    create_table :posts do |t|
      t.string :title,              null: false
      t.string :photo,              null: false
      t.string :body,               null: false
      t.timestamps
    end
  end
end
