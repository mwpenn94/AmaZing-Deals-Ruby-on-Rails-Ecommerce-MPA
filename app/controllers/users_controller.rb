class UsersController < ApplicationController
#    before_action :set_user, only: [:show, :edit]
    def index
        @users = User.all
    end

     def new
        @user = User.new
      end
    
      def create
        if @user.save
          session[:user_id] = @user.id
          redirect_to user_path(@user)
        else
          render 'new'
        end
      end
    
      def show
        @user = User.find(params[:id])
      end

      def edit
        @user = User.find(params[:id])
      end
  
      def update
        @user = User.find(params[:id])
        @user.update(user_params)
        redirect_to user_path(@user)
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_user
        @user = User.find(params[:id])
      end
  
      # Never trust parameters from the scary internet, only allow the white list through.
      def user_params
        params.require(:user).permit(:username, :email, :password, :support, :seller, :created_at, :updated_at)
      end
end
