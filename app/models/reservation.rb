class Reservation < ApplicationRecord
    belongs_to :listing
  belongs_to :user, foreign_key: 'user_id'
  # Validations
  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :end_date_after_start_date
  validate :listing_availability
  # Méthode pour calculer la durée de la réservation
  def duration
    (end_date - start_date).to_i
  end
  private
  # Validation pour s'assurer que end_date est après start_date
  def end_date_after_start_date
    if end_date.present? && start_date.present? && end_date < start_date
      errors.add(:end_date, "must be after the start date")
    end

  end
end
