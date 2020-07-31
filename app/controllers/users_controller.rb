class UsersController < ApplicationController
    before_action :set_up_users, :except => [:create]
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
      #@user = current_user
      #@user = User.find_by(id: params[:id])
      
      #@animal = Animal.find(reasons.animal_id)
      #@name = @user.name
    end

    def home
      render 'users/homepage'
    end 

    private

    def user_params
      params.require(:user).permit(:name, :password)
    end
    def set_up_users
      @user = User.find_by(id: params[:id])
    end
end