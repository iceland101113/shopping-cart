class ProductsController < ApplicationController

  def index
    @products = Product.page(params[:page]).per(12)
    @cart_product = Product.new
  end

  def show
    @product = Product.find(params[:id])
  end

  def add_to_cart
    @products = Product.page(params[:page]).per(12)
    @product = Product.find(params[:id])
    current_cart.add_cart_item(@product.id)

  end

  # def addtocart
  # end


private
  
  def cart_param
    params.require(:cartitem).permit(:product_id, :cart_id)
  end

end
