class AnimalsController < ApplicationController
    def index
        @animals = Animal.all
    end
    def new
        @animal = Animal.new
    end
    def create
       animal = Animal.create(animal_params)
       redirect_to animal_path(animal)
    end
    def show
        @animal = Animal.find_by(id: params[:id])
        @reason = @animal.reason.build(user_id: current_user.id)
    end
    def edit
        @animal = Animal.find_by(id: params[:id])
        @reason = @animal.reasons.build(user_id: current_user.id)
    end
    def update
        animal = Animal.find_by(id: params[:id])
        animal.update(animal_params)
        redirect_to animal_path(animal)
    end
    def destroy
        animal.delete(params[:animal_id])
        redirect_to root_path
    end
    private
    def animal_params
        params.require(:animal).permit(:name, :reason)
    end
end