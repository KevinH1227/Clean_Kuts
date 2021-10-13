class AddTimeSlotToAppointments < ActiveRecord::Migration[6.0]
  def change
    add_reference :appointments, :time_slot, null: false, foreign_key: true
  end
end
