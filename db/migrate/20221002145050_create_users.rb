class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.text :name
      t.text :surname
      t.text :username
      t.text :email
      t.text :password
      t.integer :phone

      t.timestamps
    end
  end
end