class CreateAppUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :app_users do |t|
      t.string :facebook_id

      t.timestamps
    end
  end
end
