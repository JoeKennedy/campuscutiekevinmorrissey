class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  helper_method :eastern

  def eastern(dt)
    @dt = dt.in_time_zone("Eastern Time (US & Canada)").strftime('%b %d, %Y %I:%M %p')
  end
end
