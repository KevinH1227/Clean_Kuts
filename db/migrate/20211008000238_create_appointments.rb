class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.references :client, null: false, foreign_key: { to_table: :users }
      t.references :barber, null: false, foreign_key: { to_table: :users }
      t.references :service, null: false, foreign_key: true
      t.boolean :status, default: true
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
