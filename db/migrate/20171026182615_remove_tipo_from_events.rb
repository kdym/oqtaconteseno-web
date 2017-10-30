class RemoveTipoFromEvents < ActiveRecord::Migration[5.0]
  def change
    remove_foreign_key :events, column: :tipo
    remove_column :events, :tipo
  end
end
