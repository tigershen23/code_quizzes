class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :title
      t.text :body
      t.integer :approver_id

      t.timestamps
    end
  end
end
