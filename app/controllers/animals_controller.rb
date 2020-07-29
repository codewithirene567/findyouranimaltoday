class AnimalsController < ApplicationController
    def index
        @animals = Animal.all
    end
    def new
        @animal = Animal.new
        @animal.reasons.build
    end
    def create
       animal = current_user.animals.build(animal_params)
       if animal.save
       #binding.pry
       redirect_to animal_path(animal)
       else
        render :new
       end
    end
    def show
        
        @animal = Animal.find_by(id: params[:id])
        #@animal = Animal.find(params[:id])
        #@reason = @animal.reasons.build(user_id: current_user.id)
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
        Animal.find(params[:id]).destroy
        redirect_to root_path
    end
    private
    def animal_params
        params.require(:animal).permit(:name, reasons_attributes: [:comment])
    end
end