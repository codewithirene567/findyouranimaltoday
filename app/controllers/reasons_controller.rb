class ReasonsController < ApplicationController
    def new
        #binding.pry
        @reason = Reason.new
        @reason.build_animal
    end
    def create
        @reason = Reason.create(reason_params)
        redirect_to user_path(reason.user)
    end
    def index
        redirect_to animal_path
    end

    private

  def reason_params
    params.require(:reason).permit(:user_id, :animal_id, :comment, animal_attributes: [:name])
  end
end