class AddGratisToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :gratis, :boolean
  end
end
