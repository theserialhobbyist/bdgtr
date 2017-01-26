module ChargesHelper
  def charge_params
    params.require(:charge).permit(:merch, :amount, :desc, :id)
  end
end
