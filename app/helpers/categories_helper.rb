module CategoriesHelper
  def category_params
    params.require(:category).permit(:cat_name, :cat_budget, :cat_average, :user_id)
  end
end
