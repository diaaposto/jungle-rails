class Admin::CategoriesController < ApplicationController

  def index
    @categories = Category.order(id: :desc).all
    @category = Category.new
  end

  def new
    @category = Category.new
    # binding.pry
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to [:admin, :categories], notice: 'Category created!'
    else
      render :new
    end
  end

  def category_params
    params.require(:category).permit(
      :name
    )
  end

end
