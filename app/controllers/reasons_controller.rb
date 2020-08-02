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
      reason = current_user.reasons.build(reason_params)
      current_user.reasons << reason
        if reason.save
           redirect_to animal_reasons_path(animal)
        else
           render 'reasons/new'
        end
    end

    def index
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
  end

end