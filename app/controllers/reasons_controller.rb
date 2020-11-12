class ReasonsController < ApplicationController
  before_action :checked_log_in
  def new
      @animal = Animal.find_by(id: params[:animal_id])
        if @animal
          @reason = @animal.reasons.build
        else
          @reason = Reason.new
        end
    end

    def create
     #binding.pry
      #animal = Animal.find_by(id: params[:animal_id])
      #reason = animal.reasons.build(reason_params)
      reason = Reason.new(reason_params) 
      reason.user=current_user
        if reason.save
           redirect_to reasons_path
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