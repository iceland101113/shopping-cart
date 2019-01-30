class OrdersController < ApplicationController
before_action :authenticate_user!

  def index
    @orders = current_user.orders.page(params[:page]).per(10)
  end

  def create
    @order = Order.new(order_params)
    @order.user_id = current_user.id
    
    if @order.save
      current_cart.cartitems.each do |item|
        orderitem = Orderitem.new
        orderitem.quantity = item.quantity
        orderitem.price = item.total_m
        orderitem.product_id = item.product_id
        orderitem.order_id = @order.id
        orderitem.save
      end
      destroy_cart
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
