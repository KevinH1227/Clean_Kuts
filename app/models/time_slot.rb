class TimeSlot < ApplicationRecord
  belongs_to :barber, foreign_key: :barber_id, class_name: 'User'
  has_many :appointments
  default_scope -> { order(:start_time) }  # Our meetings will be ordered by their start_time by default

  def multi_days?
    (end_time.to_date - start_time.to_date).to_i >= 1
  end

  def time
    "#{start_time.strftime('%I:%M %p')} - #{end_time.strftime('%I:%M %p')}"
  end
  #2021-10-30T00:00:00
end
