class AnimalsController < ApplicationController
    before_action :set_up_animal,  :except => [:create]
    def index
        @animals = Animal.all
        @reasons = Reason.all
        @users = User.all
       
    end
   
    
    def new
        @animal = Animal.new
        #@category = Category.new
    end
    def create
        
       #binding.pry
       @animal = current_user.animals.build(animal_params)
       
       #binding.pry
       if @animal.valid?
        @animal.save
            #new_reason = Reason.new(user_id:current_user.id, animal_id:5, comment: "This is our stati comment")
            #new_reason.save!
            redirect_to animal_path(@animal)
       else
        render :new
       end
       #new_reason = Reason.new(user_id:current_user.id, animal_id:@animal.id, words:words)
       #new_reason.save!
    end
    def show
        
        @animal = Animal.find_by(id: params[:id])
        #@animal = Animal.find(params[:id])
        #@reason = @animal.reasons.build(user_id: current_user.id)
    end
    def edit
        @animal = Animal.find_by(id: params[:id])
        #@reason = @animal.reasons.build(user_id: current_user.id)
    end
    def update
        #animal = Animal.find_by(id: params[:id])
        @animal.update(animal_params)
   if @animal.save

        #reasons = Reason.where(animal_id: @animal.id)
        #reasons.update(update_params)
        #reasons.each do |r|
        #    r.update(words:update_params[:words])
        #end
       
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