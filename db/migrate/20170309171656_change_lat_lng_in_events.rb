class ChangeLatLngInEvents < ActiveRecord::Migration[5.0]
  def change
    remove_column :events, :latitude
    remove_column :events, :longitude

    add_column :events, :latitude, :float
    add_column :events, :longitude, :float
  end
end
