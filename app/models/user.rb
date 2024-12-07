class User < ApplicationRecord
  # Devise modules (if needed)
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Relationships
  has_many :rides, foreign_key: :driver_id, class_name: "Ride", dependent: :destroy
  has_many :bookings, foreign_key: :passenger_id, class_name: "Booking", dependent: :destroy

  # Skip validations during seeding (only in development)
  def self.skip_validations_during_seeding?
    Rails.env.development? && $skip_validations
  end

  # Validations
  validates :email, presence: true, uniqueness: true, unless: -> { self.class.skip_validations_during_seeding? }
  validates :role, inclusion: { in: %w[driver rider] }, unless: -> { self.class.skip_validations_during_seeding? }

  # Define role check methods
  def driver?
    role == "driver"
  end

  def rider?
    role == "rider"
  end
end
