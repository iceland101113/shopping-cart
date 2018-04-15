class ProductsController < ApplicationController

  def index
    @products = Product.page(params[:page]).per(10)
    @cart = Cart.create(number: "1")
    @cart_product = Product.new
  end

  def show
    @product = Product.find(params[:id])
  end

  def addto_cart
    @product_id = params[:product_id]
    @cart_product = Product.find(@product_id)
    @cart_id = Cart.last.id
    @cartitem = Cartitem.create(product_id: @product_id, cart_id: @cart_id)
    @cart_tol = Cartitem.where(cart_id: @cart_id).count
    render :json => { :product_id => @product_id, :cart_id=> @cart_id, :cartitem_id=> @cartitem.id, :cart_product_name=> @cart_product.name, :cart_product_price=> @cart_product.price, :cart_product_image=> @cart_product.image, :cart_tol=> @cart_tol}
  end

private
  
  def cart_param
    params.require(:cartitem).permit(:product_id, :cart_id)
  end

end
