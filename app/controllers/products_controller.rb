class ProductsController < ApplicationController

  def index
    @products = Product.page(params[:page]).per(12)
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
    @cart_m_t = @cart_product.price
    @cartitem = Cartitem.create(product_id: @product_id, cart_id: @cart_id, quantity: '1', total_m: @cart_m_t)
    @cart_tol = Cartitem.where(cart_id: @cart_id).count
    @cart_p = Cartitem.where(cart_id: @cart_id).sum(:total_m)
    render :json => { :product_id => @product_id, :cart_id=> @cart_id, :cartitem_id=> @cartitem.id, :cart_product_name=> @cart_product.name, :cart_product_price=> @cart_product.price, :cart_product_image=> @cart_product.image, :cart_tol=> @cart_tol, :cart_tol_m=> @cart_p}
  end

  def de_quantity
    @cartitem = Cartitem.find(params[:id])
    @cartitem.update_attributes(quantity: params[:quantity])
    @cart_m_p = @cartitem.total_m
    @cart_p = Cartitem.where(cart_id: @cartitem.cart_id).sum(:total_m)
    render :json => { :cart_tol_m=> @cart_p }
  end

  def in_quantity
    @cartitem = Cartitem.find(params[:id])
    @cartitem.update_attributes(quantity: params[:quantity])
    @cart_m_p = @cartitem.total_m
    @cart_p = Cartitem.where(cart_id: @cartitem.cart_id).sum(:total_m)
    render :json => { :cart_tol_m=> @cart_p }
  end

private
  
  def cart_param
    params.require(:cartitem).permit(:product_id, :cart_id)
  end

end
