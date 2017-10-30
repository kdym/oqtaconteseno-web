class AddColumnToEvents < ActiveRecord::Migration[5.0]
  def change
    add_reference :events, :events_type, foreign_key: true
  end
end
