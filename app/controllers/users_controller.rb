class UsersController < ApplicationController
    def new
    end
    def home
      render 'users/homepage'
    end 
end