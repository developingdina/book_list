class ApplicationController < ActionController::Base
    helper_method :current_user
    def logged_in?
        session[:user_id].present?
     end
     
     def current_user
        @current_user ||= User.find_by(id: session[:user_id])
      end

    
end
