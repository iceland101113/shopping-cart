class OrdersController < ApplicationController
before_action :authenticate_user!

  def create
    @order = Order.new(order_params)
    @order.user_id = current_user.id
    @order.cart_id = current_cart.id
    if @order.save
      flash[:notice] = "Your order was successfully created"
      redirect_to order_path(@order)
    else
      flash.now[:alert] = "Your order was failed to create"
      render cart_path
    end
  end

  def show
    @order = Order.find(params[:id])
  end

private

  def order_params
    params.require(:order).permit(:name, :phone, :address)
  end

end
