class SessionsController < ApplicationController
    def new
        @user = User.new
    end
    def create
        #binding.pry
        #if @user = User.find_by(name: params[:name])
        #    return head(:forbidden) unless @user.authenticate(params[:password])
         #   session[:user_id] = @user.id
        #    redirect_to user_path(@user)
        #end

        #if @user = User.find_by(name: params[:name])
        #    session[:user_id] = @user.id
        #    redirect_to user_path(@user)
       # else
       #     render 'sessions/new'
       # end
   # end

         user = User.find_by(name: params[:name])

         user = user.try(:authenticate, params[:password])
    
         return render 'sessions/wrong_password' unless user
    
         session[:user_id] = user.id
    
         @user = user
    
         redirect_to user_path(@user)
     end
    def destroy
        session.delete("user_id")
        redirect_to root_path
    end
end