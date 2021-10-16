class Service < ApplicationRecord
  belongs_to :barber, foreign_key: :barber_id, class_name: 'User'
  enum cut_type: { haircut: 0, beard: 1, both: 2 }
end
