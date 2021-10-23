class ReviewsController < ApplicationController
    def index
        if params[:user_id]
            @user = User.find(params[:user_id])
            @reviews = User.find(params[:user_id]).reviews
        else
            @reviews = Review.all
        end
    end

    def show
        @review = Review.find(params[:id])
    end

    def new 
        if params[:customer_id] && !User.exists?(params[:customer_id])
            redirect_to users_path, alert: "Customer not found."
        else
            @review = Review.new(customer_id: params[:customer_id])
        end
    end

    def create
        @review = Review.new(review_params)
        @review.save
        redirect_to review_path(@review)
    end

    def edit
        if params[:customer_id]
            customer = User.find_by(id: params[:customer_id])
            if customer.nil?
                redirect_to users_path, alert: "customer not found."
            else
                @review = Customer.reviews.find_by(id: params[:id])
                redirect_to user_reviews_path(customer), alert: "review not found." if @review.nil?
            end
        else
        @review = Review.find(params[:id])
        end
    end

    def update
        @review = Review.find(params[:id])
        @review.update(review_params)
        redirect_to review_path(@review)
    end

    private

    def review_params
        params.require(:review).permit(:rating, :title, :description, :customer_id, :product_id, :created_at, :updated_at)
    end
end
