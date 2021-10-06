class CreateServices < ActiveRecord::Migration[6.0]
  def change
    create_table :services do |t|
      t.references :barber, null: false, foreign_key: true
      t.string :service_type
      t.integer :price
      t.integer :duration

      t.timestamps
    end
  end
end
