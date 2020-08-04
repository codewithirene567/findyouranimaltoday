class AnimalsController < ApplicationController
    before_action :set_up_animal,  :except => [:create]
    before_action :checked_log_in
    
    def index
        @animals = Animal.search_for_animals(params[:name]) #strong params are only needed when we update or create things in the database
    end
   
    
    def new
        @animal = Animal.new
    end

    def create
       @animal = current_user.animals.build(animal_params)
       if @animal.valid?
          @animal.save
          redirect_to animal_path(@animal)
       else
        render :new
       end
    end

    def show
        @animal = Animal.find_by(id: params[:id])
    end

    def edit
        @animal = Animal.find_by(id: params[:id])
    end

    def update
        @animal.update(animal_params)
        if @animal.save
        redirect_to animal_path(@animal)
        else
        render 'animals/edit'
        end
    end

    def destroy
        @animal = Animal.find(params[:id])
        rea =  Reason.where(animal_id: @animal.id)
        rea.each do |r|
            r.destroy
        end
        @animal.destroy
        redirect_to user_path(current_user.id)
    end

    private
    
    def animal_params
        params.require(:animal).permit(:name, :comment, :category_id)
    end

    def set_up_animal
        @animal = Animal.find_by(id: params[:id])
    end

end