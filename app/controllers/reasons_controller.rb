class ReasonsController < ApplicationController
  before_action :checked_log_in
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
      #reason = animal.reasons.build(reason_params)
      
      reason = current_user.reasons.build(reason_params)
      #binding.pry
      #Reason.all.find_by(id: params[:animal_id])
      #current_user.reasons.animals << reason
      current_user.reasons << reason
      #current_user.animals.find_by(id: params[:id]).object_id
      #if object_id.exists?

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
    end

    
    private

  def reason_params
    params.require(:reason).permit(:user_id, :animal_id, :words, animal_attributes: [:name])
    #params.require(:reason).permit(:user_id, :animal_id, :words, animal_attributes: [:name])
  end
end