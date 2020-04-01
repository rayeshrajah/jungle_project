class Admin::CategoriesController < ApplicationController
 
 def index
    @categories = Category.order(:name).all
 end

 def create
    @category = Category.new(category_params)

    if @category.save
     redirect_to [:admin, :categories], notice: 'Category is created'
    else
     render :new
    end
 end

 def new 
    @category = Category.new
 end
 
 private def catergory_params
    params.require(:product).permit(:name)
 end
end