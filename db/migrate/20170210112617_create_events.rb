class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :nome
      t.string :latitude
      t.string :longitude
      t.integer :tipo
      t.datetime :data_inicio
      t.datetime :data_fim
      t.references :app_user, foreign_key: true

      t.timestamps
    end
  end
end
