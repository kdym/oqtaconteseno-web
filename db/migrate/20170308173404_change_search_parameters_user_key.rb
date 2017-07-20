class ChangeSearchParametersUserKey < ActiveRecord::Migration[5.0]
  def change
    remove_foreign_key :search_parameters, column: :user_id
    add_column :search_parameters, :app_user_id, :integer
    add_foreign_key :search_parameters, :app_users
  end
end
