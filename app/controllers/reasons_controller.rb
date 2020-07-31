class ReasonsController < ApplicationController
    def new
        
        @reason = Reason.new
        #animal = Animal.find_by(id: params[:animal_id])
        #if Reason.includes(:animal_id)
          #redirect_to new_animal_reason_path
        #else
        #  redirect_to animals_path
        #end
        #binding.pry #if else statemetn here for if it is nested 
    end

    def create
      animal = Animal.find_by(id: params[:reason][:animal_id])
      reason = animal.reasons.build(reason_params)
      current_user.reasons << reason
      #binding.pry
      if reason.save
      #redirect_to animals_path
      redirect_to animal_reasons_path(animal.id)
      else
       render 'reasons/new'
      end
    end

    def index
        @reasons = Reason.all
        @animal = Animal.find_by(id: params[:animal_id])
        reasons = Reason.find_by(id: params[:reason])
         #need to find the animal that has an id of one then find all of the reasons that the animal has
    end

    
    private

  def reason_params
    params.require(:reason).permit(:user_id, :animal_id, :words, animal_attributes: [:name])
  end
end