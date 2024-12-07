class PagesController < ApplicationController
  def home
    @rides = Ride.all
  end

  def about
  end
end
