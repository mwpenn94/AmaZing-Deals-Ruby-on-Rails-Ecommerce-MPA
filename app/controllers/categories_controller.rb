class CategoriesController < ApplicationController
    def index
        if params[:user_id]
            @user = User.find(params[:user_id])
            @categories = User.find(params[:user_id]).categories
            if params[:tag]
                @categories = Category.tagged_wth(params[:tag])
            end
        elsif params[:tag]
            @categories = Category.tagged_with(params[:tag])
        else
            @categories = Category.all
        end
    end

    def show
        @category = Category.find(params[:id])
    end

    def new 
        @category = Category.new
    end

    def create
        @category = Category.new(category_params)
        @category.save
        redirect_to category_path(@category)
    end

    def edit
        @category = Category.find(params[:id])
    end

    def update
        @category = Category.find(params[:id])
        @category.update(category_params)
        redirect_to category_path(@category)
    end

    private

    def category_params
        params.require(:category).permit(:name, :created_at, :updated_at, :tag_list, :tag, { tag_ids: [] }, :tag_ids)
    end
end
