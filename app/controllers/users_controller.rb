class UsersController < ApplicationController
    def new
      @user = User.new
    end

    def create
      if (user = User.create(user_params))
        session[:user_id] = user.id
        redirect_to user_path(user)
      else
        render 'sessions/new'
      end
    end

    def show
      @user = User.find_by(id: params[:id])
      @name = @user.name
    end

    def home
      render 'users/homepage'
    end 

    private

    def user_params
      params.require(:user).permit(:name, :password)
    end
end