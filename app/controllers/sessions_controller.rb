class SessionsController < ApplicationController
    def new
        @user = User.new
    end

    def create
         user = User.find_by(name: params[:name])
         user = user.try(:authenticate, params[:password])
         return render 'sessions/wrong_password' unless user
         session[:user_id] = user.id
         @user = user
         redirect_to user_path(@user)
     end

    def destroy
        #if logged_in?
        #session.clear
        session.delete("user_id")
        redirect_to new_session_path
        #change route for log out link to destroy route
        #end
    end
end