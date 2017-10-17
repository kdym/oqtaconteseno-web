class ChangeUserForeignKeyInEvents < ActiveRecord::Migration[5.0]
  def change
    remove_foreign_key :events, :app_users

    add_column :events, :user_id, :integer
    add_foreign_key :events, :users
  end
end
