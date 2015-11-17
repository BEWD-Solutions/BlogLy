class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :post_text
      t.string :post_title
      t.string :cover_image
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
