class HomeController < ApplicationController
  def index
    
    
    
    if user_signed_in?
      redirect_to dashboard_path
      #redirect_to courses_path
    else
      redirect_to new_user_session_path
      #redirect_to courses_path
    end
  end
end
