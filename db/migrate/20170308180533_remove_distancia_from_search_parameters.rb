class RemoveDistanciaFromSearchParameters < ActiveRecord::Migration[5.0]
  def change
    remove_column :search_parameters, :distancia
  end
end
