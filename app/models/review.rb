class Review < ApplicationRecord
  belongs_to :client, foreign_key: :client_id, class_name: 'User'
  belongs_to :barber, foreign_key: :barber_id, class_name: 'User'
end
