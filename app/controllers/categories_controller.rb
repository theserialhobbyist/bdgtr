class CategoriesController < ApplicationController
  include CategoriesHelper

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])

    @charge = Charge.new
    @charge.category_id = @category_id

    i = 0
    avg = 0
    @category.charges.each do |charge|
      i = i + 1
      avg = avg + charge.amount
      @category.cat_average = avg / i
    end

  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.save
    redirect_to category_path(@category)
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_path
  end


end
