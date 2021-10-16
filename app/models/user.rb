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

  # validates :first_name, presence: true
  # validates :last_name, presence: true
  # validates :address, presence: true
  # validates_format_of :phone_number, :with =>  /\d[0-9]\)*\z/ , :message => "Only positive number without spaces are allowed"
end
