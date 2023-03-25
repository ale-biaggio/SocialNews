class CreateUserReports < ActiveRecord::Migration[7.0]
  def change
    create_table :user_reports do |t|
      t.string :topic
      t.string :email
      t.text :message

      t.timestamps
    end
  end
end
