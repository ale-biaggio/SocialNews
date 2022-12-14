class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :category
      t.text :body
      t.text :url
      t.integer :rank, default: 0
      t.string :img_test, default: nil
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end

end
