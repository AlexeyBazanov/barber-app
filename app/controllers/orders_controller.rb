class OrdersController < ApplicationController
  def create
    @order = Order.new(order_params)
    @order.name = "Клиент #{Order.count + 1}"

    respond_to do |format|
      if verify_recaptcha(model: @order) && @order.save
        @order = Order.new
        format.js { render 'success' }
      else
        format.js { render 'create' }
      end
    end
  end

  protected

  def order_params
    params.require(:order).permit(:name, :contacts)
  end
end
