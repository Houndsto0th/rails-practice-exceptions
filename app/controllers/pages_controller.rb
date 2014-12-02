class PagesController < ApplicationController

  before_action :authorize

  def index
  end


  private

  def authorize
    if session[:user_id] != 3
      raise AccessDenied
    end
  end


end
