class ReasonsController < ApplicationController
    def new
        #binding.pry
        @reason = Reason.new
        @reason.build_animal
    end

    def create
      
      if reason = Reason.create(reason_params)
        reason.save
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
    params.require(:reason).permit(:user_id, :animal_id, :comment, animal_attributes: [:name])
  end
end