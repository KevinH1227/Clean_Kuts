class CreateFavorites < ActiveRecord::Migration[6.0]
  def change
    create_table :favorites do |t|
      t.references :barber, null: false, foreign_key: { to_table: :users }
      t.references :client, null: false, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
