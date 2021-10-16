class CreateTimeSlots < ActiveRecord::Migration[6.0]
  def change
    create_table :time_slots do |t|
      t.references :barber, null: false, foreign_key: { to_table: :users }
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
