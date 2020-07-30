class AnimalsController < ApplicationController
    before_action :set_up_animal,  :except => [:create]
    def index
        @animals = Animal.all
    end
    def new
        @animal = Animal.new
        
    end
    def create
        #binding.pry
       @animal = current_user.animals.build(animal_params)
       if @animal.save
            #new_reason = Reason.new(user_id:current_user.id, animal_id:5, comment: "This is our stati comment")
            #new_reason.save!
            redirect_to animal_path(@animal)
       else
        render :new
       end
       new_reason = Reason.new(user_id:current_user.id, animal_id:@animal.id, comment:@animal.comment)
       new_reason.save!
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
        params.require(:animal).permit(:name, :comment, reasons_attributes: [:comment])
    end
    def set_up_animal
        @animal = Animal.find_by(id: params[:id])
    end
end