class DepartmentsController < ApplicationController
    def index
        @departments = Department.all
    end

    def show
        @department = Department.find(params[:id])
    end

    def new
        @department = Department.new
    end

    def create
        @department = Department.new(department_params)
        @department.save
        redirect_to department_path(@department)
    end

    def edit
        @department = Department.find(params[:id])
    end

    def update
        @department = Department.find(params[:id])
        @department.update(department_params)
        redirect_to department_path(@department)
    end

    private

    def department_params
        params.require(:department).permit(:name, :created_at, :updated_at)
    end
end
