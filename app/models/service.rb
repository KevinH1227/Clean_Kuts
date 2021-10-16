class Service < ApplicationRecord
  belongs_to :barber, class_name: 'User'
end
