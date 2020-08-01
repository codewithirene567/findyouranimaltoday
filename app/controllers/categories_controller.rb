class CategoriesController < ApplicationController
    before_action :checked_log_in
    def new
        @category = Category.new
    end

    def create
        #binding.pry
        #@category = Category.new(category_params)
        #@animal = Animal.find_by(id: params[:id])
        #@category = @animal.build_category(category_params)
        #for a belongs to relationship you should use a _category with an underscore
        #@animal = animal.category
        @category = Category.create(category_params)
            if @category.save
                redirect_to category_path(@category)
            else
            render :new
            end
    end

    def show
        @category = Category.find_by(id: params[:id])
    end

    private
    def category_params
        params.require(:category).permit(:value, :animals)
    end
end