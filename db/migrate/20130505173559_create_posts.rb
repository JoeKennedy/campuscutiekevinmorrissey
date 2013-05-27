class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.references :user
      t.text :message
      t.string :image
      t.boolean :is_approved
      t.string :category

      t.timestamps
    end
  end
end
