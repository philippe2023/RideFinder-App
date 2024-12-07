class Ride < ApplicationRecord
  belongs_to :driver, class_name: "User"
  has_many :bookings, dependent: :destroy

  # Temporarily disable validations for seeding
  validates :departure_location, :arrival_location, :departure_time, :price_per_seat, :available_seats, :additional_info, presence: true

  # Add a fallback for enum handling
  def self.statuses
    { available: 0, booked: 1, completed: 2 }
  end
end
