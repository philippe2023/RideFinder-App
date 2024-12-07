class BookingsController < ApplicationController
  before_action :authenticate_user!

  def index
    @bookings = current_user.bookings.includes(:ride)
  end

  def create
    @ride = Ride.find(params[:ride_id])

    # Check if the user has already booked this ride
    if current_user.bookings.where(ride: @ride).exists?
      redirect_to ride_path(@ride), alert: "You have already booked this ride."
      return
    end

    # Create the booking
    @booking = Booking.new(passenger: current_user, ride: @ride, status: "pending")

    if @booking.save
      redirect_to bookings_path, notice: "Ride successfully booked!"
    else
      redirect_to ride_path(@ride), alert: "Failed to book the ride. Please try again."
    end
  end
end
