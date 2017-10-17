class ChangeLocationFieldsInEvents < ActiveRecord::Migration[5.0]
  def change
    remove_column :events, :latitude
    remove_column :events, :longitude

    add_column :events, :latitude, :string
    add_column :events, :longitude, :string
  end
end
