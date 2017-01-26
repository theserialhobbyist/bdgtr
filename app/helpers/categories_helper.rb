module CategoriesHelper
  def category_params
    params.require(:category).permit(:cat_name, :cat_budget, :cat_average)
  end
end
