class AnimalsController < ApplicationController
    def index
        @animals = Animal.all
    end
    def new
        @animal = Animal.new
    end
    def create
       @animal = Animal.create(animal_params)
       #binding.pry
       redirect_to animal_path(:id)
    end
    def show
        @animal = Animal.find_by(id: params[:id])
       # @reason = @animal.reason.build(user_id: current_user.id)
        # animal GET    /animals/:id(.:format)             animals#show
    end
    def edit
        @animal = Animal.find_by(id: params[:id])
        #@reason = @animal.reasons.build(user_id: current_user.id)
    end
    def update
        animal = Animal.find_by(id: params[:id])
        animal.update(animal_params)
        redirect_to animal_path(animal)
    end
    def destroy
        animal.delete(animal_params)
        redirect_to root_path
    end
    private
    def animal_params
        params.require(:animal).permit(:name, reason_attributes: [:comment])
    end
end