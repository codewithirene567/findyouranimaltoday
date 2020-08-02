class ApplicationController < ActionController::Base
 
    def current_user
        return unless session[:user_id] 
        @current_user ||= User.find(session[:user_id])
      end

      helper_method :current_user
     
      def logged_in?
        !!session[:user_id]
      end

      helper_method :logged_in?
    
      def checked_log_in
          if !logged_in?
          flash[:notice]= "Hey you aren’t logged in! Fill this in before you do anything."
          redirect_to new_session_path
          end
      end
      
      helper_method :checked_log_in
   
end
