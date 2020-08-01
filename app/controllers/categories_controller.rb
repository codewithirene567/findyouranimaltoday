class CategoriesController < ApplicationController
    def new
        @category = Category.new
    end

    def create
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