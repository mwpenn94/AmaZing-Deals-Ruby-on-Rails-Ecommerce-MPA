class QuestionsController < ApplicationController
    def index
        if params[:user_id]
            @user = User.find(params[:user_id])
            @questions = User.find(params[:user_id]).questions
        else
            @questions = Question.all
        end
    end

    def show
        @question = Question.find(params[:id])
    end

    def new 
        if params[:customer_id] && !User.exists?(params[:customer_id])
            redirect_to users_path, alert: "Customer not found."
        else
            @question = Question.new(customer_id: params[:customer_id])
        end
    end

    def create
        @question = Question.new(question_params)
        @question.save
        redirect_to question_path(@question)
    end

    def edit
        if params[:customer_id]
            customer = User.find_by(params[:customer_id])
            if customer.nil?
                redirect_to users_path, alert: "customer not found."
            else
                @question = Customer.questions.find_by(id: params[:id])
                redirect_to user_questions_path(customer), alert: "question not found." if @question.nil?
            end
        else
        @question = question.find(params[:id])
        end
    end

    def update
        @question = Question.find(params[:id])
        @question.update(question_params)
        redirect_to question_path(@question)
    end

    private

    def question_params
        params.require(:question).permit(:name, :description, :customer_id, :product_id, :created_at, :updated_at)
    end
end
