class User < ApplicationRecord
  has_one_attached :photo
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  enum role: {
    client: 0,
    barber: 1
  }

  has_many :reviews, foreign_key: :client_id, class_name: "Review", dependent: :destroy
  has_many :reviews, foreign_key: :barber_id, class_name: "Review", dependent: :destroy

  has_many :sent_messages, foreign_key: :sender_id, class_name: "Message", dependent: :destroy
  has_many :received_messages, foreign_key: :recipient_id, class_name: "Message", dependent: :destroy

  # has_many :chatrooms, through: :received_messages, foreign_key: :recipient_id, class_name: "Message"

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

  def average_rating
    return nil if self.reviews.count == 0
    return self.reviews.reduce(0) { |sum, review| sum + review.rating } / self.reviews.count
  end
end
