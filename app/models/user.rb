class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
        enum role: [:client, :barber]

        has_many :sent_messages, foreign_key: :sender_id, class_name: "Message"
        has_many :received_messages, foreign_key: :recipient_id, class_name: "Message"

        validates :first_name, presence: true
        validates :last_name, presence: true
        validates :email, presence: true
        validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 
        validates :address, presence: true
        validates :phone_number, presence: true
        validates_format_of :phone_number,
            :with => /\(?[0-9]{3}\)?-[0-9]{3}-[0-9]{4}/,
            :message => "- Phone numbers must be in xxx-xxx-xxxx format."
end