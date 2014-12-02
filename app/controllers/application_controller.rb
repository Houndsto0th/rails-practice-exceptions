class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  class AccessDenied < StandardError
  end

  rescue_from AccessDenied, with: :unfound

  before_action :ensure_logged_in

  def ensure_logged_in
    if session[:user_id].nil?
      redirect_to signin_path
    end
  end

  def unfound
    render "public/404", status: :not_found, layout: false
  end

end
