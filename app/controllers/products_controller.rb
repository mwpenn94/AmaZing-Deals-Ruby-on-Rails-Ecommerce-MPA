class ProductsController < ApplicationController
    def index
        @search = params[:search]
        if params[:user_id]
            @user = User.find(params[:user_id])
            if @search.present?
                @name = @search[:name]
                @products = User.find(params[:user_id]).products.where(name: @name)
            elsif params[:tag]
                if @search.present?
                    @name = @search[:name]
                    @products = Product.tagged_with(params[:tag]).where(name: @name)
                else
                    @products = Product.tagged_with(params[:tag])
                end
            else
                @products = User.find(params[:user_id]).products
            end
        elsif params[:tag]
            if @search.present?
                @name = @search[:name]
                @products = Product.tagged_with(params[:tag]).where(name: @name)
            end
        else
            if @search.present?
                @name = @search[:name]
                @products = Product.where(name: @name)
            else
                @products = Product.all
            end
        end
    end

    def show
        @user = User.find(params[:user_id]) if params[:user_id]
        @product = Product.find(params[:id])
    end

    def new 
        if params[:seller_id] && !User.exists?(params[:seller_id])
            redirect_to users_path, alert: "Seller not found."
        else
            @product = Product.new(seller_id: params[:seller_id])
        end
    end

    def create
        @product = Product.new(product_params)
        @product.save
        redirect_to product_path(@product)
    end

    def edit
        if params[:seller_id]
            seller = User.find_by(id: params[:seller_id])
            if seller.nil?
                redirect_to users_path, alert: "Seller not found."
            else
                @product = seller.products.find_by(id: params[:id])
                redirect_to user_products_path(seller), alert: "Product not found." if @product.nil?
            end
        else
        @product = Product.find(params[:id])
        end
    end

    def update
        @product = Product.find(params[:id])
        @product.update(product_params)
        redirect_to product_path(@product)
    end

    def destroy
        @product = Product.find(params[:id])
        @product.destroy
        redirect_to products_path
    end
    
    private

    def product_search

    end

    def product_params
        params.require(:product).permit(:name, :price, :description, :seller_id, :created_at, :updated_at, :tag_list, :tag, { tag_ids: [] }, :tag_ids)
    end
end
