class LineitemsController < ApplicationController
    def show
        @lineitem = Lineitem.find(params[:id])
    end

    def create
        chosen_product = Product.find(params[:product_id])
        current_cart = @current_cart
        if current_cart.products.include?(chosen_product)
            @lineitem = current_cart.lineitems.find_by(:product_id => chosen_product)
            @lineitem.quantity = 0 if @lineitem.quantity.nil?
            @lineitem.quantity += 1
        else
            @lineitem = Lineitem.new
            @lineitem.cart = current_cart
            @lineitem.product = chosen_product
        end
        @lineitem.save
        redirect_to cart_path(current_cart)
    end

    def add_quantity
        @lineitem = Lineitem.find(params[:id])
        @lineitem.quantity = 0 if @lineitem.quantity.nil?
        @lineitem.quantity += 1
        @lineitem.save
        redirect_to cart_path(@current_cart)
      end
      
      def reduce_quantity
        @lineitem = Lineitem.find(params[:id])
        if @lineitem.quantity > 1
          @lineitem.quantity -= 1
        end
        @lineitem.save
        redirect_to cart_path(@current_cart)
      end

    def destroy
        @lineitem = Lineitem.find(params[:id])
        @lineitem.destroy
        redirect_to cart_path(@current_cart)
    end
    private

    def lineitem_params
        params.require(:lineitem).permit(:quantity, :price, :order_id, :product_id, :cart_id, :created_at, :updated_at)
    end
end
