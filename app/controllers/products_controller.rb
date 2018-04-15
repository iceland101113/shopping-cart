class ProductsController < ApplicationController

  def index
    @products = Product.page(params[:page]).per(10)
    @cart = Cart.create(number: "1")
    
  end

  def show
    @product = Product.find(params[:id])
  end

  def addto_cart
    @product_id = params[:product_id]
    @cart_product = Product.find(@product_id)
    @cart_id = Cart.last.id
    @cartitem = Cartitem.create(product_id: @product_id, cart_id: @cart_id)

    render :json => { :product_id => @product_id, :cart_id=> @cart_id, :cartitem_id=> @cartitem.id}
  end

private
  
  def cart_param
    params.require(:cartitem).permit(:product_id, :cart_id)
  end

end
