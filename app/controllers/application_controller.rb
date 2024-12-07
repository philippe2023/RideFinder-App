class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Redirect users who do not meet role requirements
  def authorize_driver
    redirect_to root_path, alert: "Access denied! Drivers only." unless current_user.driver?
  end

  def authorize_rider
    redirect_to root_path, alert: "Access denied! Riders only." unless current_user.rider?
  end
end
