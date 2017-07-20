class RemoveUserIdFromSearchParameters < ActiveRecord::Migration[5.0]
  def change
    remove_column :search_parameters, :user_id
  end
end
