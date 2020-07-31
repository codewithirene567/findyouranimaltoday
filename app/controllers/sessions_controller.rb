class SessionsController < ApplicationController
    def new
        @user = User.new
    end
    def create
        #binding.pry
        if @user = User.find_by(name: params[:name])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render 'sessions/new'
        end
    end
    def destroy
        session.delete("user_id")
        redirect_to root_path
    end
end