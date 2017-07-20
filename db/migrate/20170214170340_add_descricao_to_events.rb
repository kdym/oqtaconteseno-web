class AddDescricaoToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :descricao, :text
  end
end
