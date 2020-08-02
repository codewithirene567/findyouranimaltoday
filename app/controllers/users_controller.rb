class UsersController < ApplicationController
    before_action :set_up_users, :except => [:create]
    before_action :checked_log_in, :except => [:new, :create, :home]
  def new
      @user = User.new
    end

    def create
      @user = User.new(user_params)

      if @user.valid?
        @user = User.create(user_params)
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        render 'users/new'
      end
    end

    def show
      @user = current_user
      @user = User.find_by(id: params[:id])
    end

    def home
      render 'users/homepage'
    end 

     def authenticate(password)
       salt = password_digest[0..28]
       hashed = BCrypt::Engine::hash_secret(password, salt)
      return nil unless (salt + hashed) == self.password_digest
     end

     
    private

    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation)
    end
    def set_up_users
      @user = User.find_by(id: params[:id])
    end
end