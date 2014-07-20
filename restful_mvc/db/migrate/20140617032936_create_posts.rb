class CreatePosts < ActiveRecord::Migration
  def change
    drop_table :posts
    create_table :posts do |t|
      t.integer :user_id
      t.text :body
      t.timestamps
    end
  end
end
