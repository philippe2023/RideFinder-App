class RidesController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_driver, only: [ :new, :create, :edit, :update, :destroy ]
  before_action :authorize_rider, only: [ :index, :search ]
  before_action :set_ride, only: [ :show, :edit, :update, :destroy ]

  def index
    if current_user.driver?
      @rides = current_user.rides.order(departure_time: :asc) # Show only rides created by this driver
    elsif current_user.rider?
      @rides = Ride.all.order(departure_time: :asc) # Show all available rides for riders
    else
      @rides = Ride.none # Fallback
    end
  end

  def show
    # @ride is set by set_ride
  end

  def new
    @ride = Ride.new
  end

  def create
    @ride = current_user.rides.build(ride_params)
    if @ride.save
      redirect_to rides_path, notice: "Ride created successfully!"
    else
      flash.now[:alert] = "Error creating ride. Please check the form."
      render :new
    end
  end

  def edit
    # @ride is set by set_ride
  end

  def update
    if @ride.update(ride_params)
      redirect_to @ride, notice: "Ride updated successfully!"
    else
      flash.now[:alert] = "Failed to update ride."
      render :edit
    end
  end

  def destroy
    @ride.destroy
    redirect_to rides_path, notice: "Ride deleted successfully."
  end

  def search
    @rides = search_rides(params[:from], params[:to])
    render :index
  end

  private

  # Extract search logic for better readability
  def search_rides(from_location, to_location)
    if from_location.present? && to_location.present?
      direct_routes(from_location, to_location) + connected_routes(from_location, to_location)
    elsif from_location.present?
      Ride.where(departure_location: from_location)
    elsif to_location.present?
      Ride.where(arrival_location: to_location)
    else
      Ride.none # No rides if no search parameters are provided
    end
  end

  # Returns direct routes between two locations
  def direct_routes(from_location, to_location)
    Ride.where(departure_location: from_location, arrival_location: to_location)
  end

  # Returns connected routes if no direct route exists
  def connected_routes(from_location, to_location)
    Ride.joins("INNER JOIN rides AS next_leg ON rides.arrival_location = next_leg.departure_location")
        .where("rides.departure_location = ? AND next_leg.arrival_location = ?", from_location, to_location)
        .select("rides.*, next_leg.departure_location AS connection, next_leg.arrival_location AS final_destination")
  end

  def ride_params
    params.require(:ride).permit(:departure_location, :arrival_location, :departure_time, :arrival_time, :price_per_seat, :available_seats, :additional_info)
  end

  def authorize_driver
    redirect_to root_path, alert: "You are not authorized to perform this action." unless current_user&.driver?
  end

  def authorize_rider
    return if current_user.rider? || current_user.driver? # Allow both riders and drivers
    redirect_to root_path, alert: "You are not authorized to view this page."
  end

  def set_ride
    @ride = Ride.find(params[:id])
  end
end
