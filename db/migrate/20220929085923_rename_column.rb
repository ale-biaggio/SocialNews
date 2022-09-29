class RenameColumn < ActiveRecord::Migration[7.0]
  def change
    rename_column :posts, :tag, :category
  end
end
