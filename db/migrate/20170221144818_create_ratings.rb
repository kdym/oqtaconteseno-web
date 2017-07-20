class CreateRatings < ActiveRecord::Migration[5.0]
  def change
    create_table :ratings do |t|
      t.references :app_user, foreign_key: true
      t.references :event, foreign_key: true
      t.text :comentario
      t.integer :nota

      t.timestamps
    end
  end
end
