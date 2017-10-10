class CreateEventsTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :events_types do |t|
      t.string :nome
      t.binary :icone, limit: 2.megabytes
    end
  end
end
