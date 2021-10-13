class CreateTimeSlots < ActiveRecord::Migration[6.0]
  def change
    create_table :time_slots do |t|
      t.references :barber, null: false, foreign_key: { to_table: :users }
      t.time :start_time
      t.time :end_time

      t.timestamps
    end
  end
end
