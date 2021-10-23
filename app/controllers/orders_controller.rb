class OrdersController < ApplicationController
    def index
        if params[:user_id]
            @user = User.find(params[:user_id])
            @orders = User.find(params[:user_id]).orders
        else
            @orders = Order.all
        end
    end

    def show
        @order = Order.find(params[:id])
    end

    def new
        @order = Order.new
    end

    def create
        @order = Order.new(order_params)
        @current_cart.lineitems.each do |item|
          @order.lineitems << item
          item.cart_id = nil
        end

        @order.email = current_user.email
        @order.total = @order.sub_total
        active_merchant_biller
        @order.save
        Cart.destroy(session[:cart_id])
        session[:cart_id] = nil
        redirect_to order_path(@order)
    end

    def edit
        @order = Order.find(params[:id])
    end

    def update
        @order = Order.find(params[:id])
        @order.update(order_params)
        redirect_to order_path(@order)
    end

    
    def destroy
        @order = Order.find(params[:id])
        @order.destroy
        redirect_to orders_path
    end
    
    private

    def active_merchant_sub_total
        @order.sub_total * 100
    end

    def active_merchant_biller
        credit_card = ActiveMerchant::Billing::CreditCard.new(
        :number     => order_params[:card_number],
        :month      => order_params[:card_expiration_date].split("-")[1],
        :year       => order_params[:card_expiration_date].split("-")[0],
        :first_name => order_params[:bill_firstname],
        :last_name  => order_params[:bill_lastname],
        :verification_value  =>  order_params[:card_verification]
        )
        if credit_card.valid?
          gateway = ActiveMerchant::Billing::TrustCommerceGateway.new(
            :login    => 'TestMerchant',
            :password => 'password'
            ) 
            response = gateway.authorize(active_merchant_sub_total, credit_card)
             if response.success?
              gateway.capture(active_merchant_sub_total, response.authorization)
            else
                flash[:error] = "Insufficient funds. Please enter a different payment method."
            end
        else
            flash[:error] = "Please enter information to resolve the following errors: #{credit_card.validate}"
            redirect to "/orders/new"
        end
    end

    def order_params
        params.require(:order).permit(:card_number, :card_expiration_date, :card_verification, :bill_firstname, :bill_lastname, :bill_address1, :bill_address2, :bill_city, :bill_state, :bill_zipcode, :ship_firstname, :ship_lastname, :ship_address1, :ship_address2, :ship_city, :ship_state, :ship_zipcode, :phone, :total, :customer_id, :created_at, :updated_at)
    end
end
