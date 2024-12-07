class Booking < ApplicationRecord
  belongs_to :passenger, class_name: "User"
  belongs_to :ride

  validates :status, presence: true
end
