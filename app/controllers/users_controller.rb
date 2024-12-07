class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
    if current_user.driver?
      @created_rides = current_user.rides.order(created_at: :desc)
    elsif current_user.rider?
      @booked_rides = current_user.bookings.includes(:ride)
    end
  end
end
