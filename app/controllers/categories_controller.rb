class CategoriesController < ApplicationController
  include CategoriesHelper

  before_filter :require_login

  def require_login
    unless current_user
      redirect_to new_user_session_path
    end

  end

  def index
    @categories = current_user.categories.all
  end

  def show
    @passed_id = params[:user_id].to_i
    @current_user_id = current_user.id.to_i
    @category = Category.find(params[:id])
    @id_match = "not checked"

    if @passed_id == @current_user_id
      @id_match = "checked, they match"
      @charge = Charge.new
      @charge.category_id = @category_id

      i = 0
      avg = 0

      @category.charges.each do |charge|
        i = i + 1
        avg = avg + charge.amount
        @category.cat_average = avg / i
      end
    else
      @id_match = "checked, no match"
      redirect_to user_categories_path(@category.user_id)
    end
  end
  

  def new
    @user = current_user
    @category = current_user.categories.new
  end

  def create
    @category = Category.new(category_params)
    @category.user_id = params[:user_id]

    @category.save

    redirect_to user_categories_path(@category)
  end

  def destroy
    @category = current_user.categories.find(params[:id])
    @category.destroy
    redirect_to user_categories_path(@category.user_id)
  end


end
