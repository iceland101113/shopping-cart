class CartitemsController < ApplicationController

  def update

    @cartitem = Cartitem.find(params[:id])
    if @cartitem.quantity > 1

      if params[:commit] == "-"
        quantity = @cartitem.quantity - 1
      else
        quantity = @cartitem.quantity + 1
      end

    else     

      if params[:commit] == "+"
        quantity = @cartitem.quantity + 1   
      end 

    end

      total_money = @cartitem.product.price*quantity
      @cartitem.update_attributes(quantity: quantity, total_m: total_money) 

  end

  def destroy

    @cartitem = Cartitem.find(params[:id])
    @cartitem.destroy
    flash[:alert] = "category was successfully deleted"

  end

end
