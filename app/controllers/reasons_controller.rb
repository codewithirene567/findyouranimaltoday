class ReasonsController < ApplicationController
    def new
      animal = Animal.find_by(id: params[:animal_id])
        if animal
          @reason = animal.reasons.build
        else
          @reason = Reason.new
          redirect_to animals_path
        end
    end

    def create
      animal = Animal.find_by(id: params[:reason][:animal_id])
      reason = animal.reasons.build(reason_params)
      current_user.reasons << reason
      
      if reason.save
      #redirect_to animals_path
      redirect_to animal_reasons_path(animal)
      else
       render 'reasons/new'
      end
    end

    def index
        #@reasons = Reason.all
        @animal = Animal.find_by(id: params[:animal_id])
        if @animal
          @reasons = @animal.reasons
        else
          redirect_to user_path(current_user)
        end
        #reasons = Reason.find_by(id: params[:user_id][:words])
        #@user = current_user
        #binding.pry
        #user = current_user.find_by(id: params[:reasons][:words])
         #need to find the animal that has an id of one then find all of the reasons that the animal has
    end

    
    private

  def reason_params
    params.require(:reason).permit(:user_id, :animal_id, :words, animal_attributes: [:name])
  end
end