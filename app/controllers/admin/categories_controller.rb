class Admin::CategoriesController < ApplicationController
 
 def index
    @categories = Category.order(:name).all
 end

 def create
 end

 def new 
    @category = Category.new
 end
 
 def index
 end

 private def catergory_params
    params.require(:product).permit(:name)
 end
end