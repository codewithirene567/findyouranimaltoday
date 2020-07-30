class ApplicationController < ActionController::Base
   
    #current_user = User.last
   # def current_user
        #@current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
      #  @current_user = User.last
    #end
    def current_user
        return unless session[:user_id] 
        #@current_user = User.last
        #return @current_user
        @current_user ||= User.find(session[:user_id])
      end
      helper_method :current_user
    # private
    #     def current_user
    #         #@current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
    #         @current_user = User.last
    #     end
end
