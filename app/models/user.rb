class User < ApplicationRecord
  # Associations
  has_many :reservations, foreign_key: 'user_id', dependent: :destroy
  has_many :listings, foreign_key: 'user_id', dependent: :destroy

  has_many :potins, dependent: :destroy

  # Validations
  VALID_PHONE_REGEX = /\A(?:(?:\+|00)33[\s.-]{0,3}(?:(0)[\s.-]{0,3})?|0)[1-9]\z/
  validates :email,
            presence: true,
            uniqueness: true,
            format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :phone_number,
            presence: true,
            format: { with: VALID_PHONE_REGEX, message: "please enter a valid french number" }
  validates :description, allow_blank: true, length: { maximum: 1000 }
end
