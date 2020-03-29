class OrdersController < ApplicationController

  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        @order = Order.new
        format.js { render 'success' }
      else
        format.js { render 'create' }
      end
    end
  end

  protected

  def order_params
    params.require(:order).permit(:name, :email, :phone)
  end
end