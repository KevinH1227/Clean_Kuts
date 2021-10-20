class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  enum role: {
    client: 0,
    barber: 1
  }

  has_many :sent_messages, foreign_key: :sender_id, class_name: "Message"
  has_many :received_messages, foreign_key: :recipient_id, class_name: "Message"

  has_many :appointments, foreign_key: :client_id, class_name: "Appointment", dependent: :destroy
  has_many :appointments, foreign_key: :barber_id, class_name: "Appointment", dependent: :destroy

  has_many :services, foreign_key: :barber_id, class_name: 'Service', dependent: :destroy
  has_many :time_slots, foreign_key: :barber_id, class_name: 'TimeSlot', dependent: :destroy

  # validates :first_name, presence: true
  # validates :last_name, presence: true
  # validates :address, presence: true
  # validates_format_of :phone_number, :with =>  /\d[0-9]\)*\z/ , :message => "Only positive number without spaces are allowed"
  def full_name
    "#{first_name} #{last_name}"
  end
end
