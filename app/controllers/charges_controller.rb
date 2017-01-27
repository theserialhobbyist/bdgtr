class ChargesController < ApplicationController
  include ChargesHelper

  before_filter :require_login

  def require_login
    unless current_user
      redirect_to new_user_session_path
    end

  end

  def create
    @charge = Charge.new(charge_params)
    @charge.category_id = params[:category_id]
    @charge.date = Time.now

    @charge.save

    redirect_to user_category_path(@charge.category.user_id, @charge.category)
  end

  def destroy
    @charge = Charge.find(params[:id])
    @charge.destroy
    redirect_to user_category_path(@charge.category.user_id, @charge.category)
  end

end
