class CreateSearchParameters < ActiveRecord::Migration[5.0]
  def change
    create_table :search_parameters do |t|
      t.string :tipos
      t.integer :distancia
      t.integer :periodo
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
