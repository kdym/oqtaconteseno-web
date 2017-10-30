class AddWidthToEventsTypes < ActiveRecord::Migration[5.0]
  def change
    add_column :events_types, :width, :integer
  end
end
