class TimeSlot < ApplicationRecord
  belongs_to :barber, foreign_key: :barber_id, class_name: 'User'
end