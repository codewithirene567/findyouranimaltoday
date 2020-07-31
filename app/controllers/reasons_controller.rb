class ReasonsController < ApplicationController
    def new
        
        @reason = Reason.new
        #binding.pry
    end

    def create
      animal = Animal.find_by(id: params[:reason][:animal_id])
      reason = animal.reasons.build(reason_params)
      current_user.reasons << reason
      #binding.pry
      if reason.save
      redirect_to animals_path
      else
       render 'reasons/new'
      end
    end

    def index
        redirect_to animal_path
    end

    private

  def reason_params
    params.require(:reason).permit(:user_id, :animal_id, :words, animal_attributes: [:name])
  end
end