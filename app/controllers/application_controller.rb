class ApplicationController < ActionController::Base
 
  #current_user = User.last
   # def current_user
        #@current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
      #  @current_user = User.last
    #end
   # helpers do 
    def current_user
        return unless session[:user_id] 
        #@current_user = User.last
        #return @current_user
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
    #end

    # private
    #     def current_user
    #         #@current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
    #         @current_user = User.last
    #     end
end
