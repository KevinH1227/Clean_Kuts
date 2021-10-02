class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.references :client, null: false, foreign_key: { to_table: :users }
      t.references :barber, null: false, foreign_key: { to_table: :users }
      t.string :title
      t.string :comment
      t.datetime :date
      t.integer :rating

      t.timestamps
    end
  end
end
