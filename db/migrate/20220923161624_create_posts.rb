class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :tag
      t.text :body
      t.string :image
      t.integer :rank

      t.timestamps
    end
  end

end
