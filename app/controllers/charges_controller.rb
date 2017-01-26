class ChargesController < ApplicationController
  include ChargesHelper

  def create
    @charge = Charge.new(charge_params)
    @charge.category_id = params[:category_id]
    @charge.date = Time.now

    @charge.save

    redirect_to category_path(@charge.category)
  end

  def destroy
    @charge = Charge.find(params[:id])
    @charge.destroy
    redirect_to category_path(@charge.category)
  end

end
