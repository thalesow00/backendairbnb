class Listing < ApplicationRecord
  
    has_many :reservations, dependent: :destroy
  # Validations
  validates :available_beds,
            presence: true,
            numericality: { only_integer: true, greater_than: 0 }
  validates :price,
            presence: true,
            numericality: { only_integer: true, greater_than: 0 }
  validates :description,
            presence: true,
            length: { minimum: 140 }
  validates :has_wifi,
            inclusion: { in: [true, false] }
  validates :welcome_message,
            presence: true
  # Méthode pour vérifier les réservations qui se chevauchent
  def overlapping_reservation?(start_date, end_date)
    reservations.where("start_date < ? AND end_date > ?", end_date, start_date).exists?
  end
end
