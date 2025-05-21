class City < ApplicationRecord
  # Associations
  has_many :listings, dependent: :destroy
  # Validations
  VALID_ZIP_CODE_REGEX = /\A(([0-8][0-9])|(9[0-5])|(2[ab]))[0-9]{3}\z/
  validates :name, presence: true
  validates :zip_code,
            presence: true,
            uniqueness: true,
            format: { with: VALID_ZIP_CODE_REGEX, message: "please enter a valid french zip code" }
end
