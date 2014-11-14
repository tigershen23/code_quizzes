class AddPolymorphismToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :commentable_id, :integer
    add_column :articles, :commentable_type, :string
  end
end
