module Api
  module V1
	class StudentsController < ApplicationController
	  before_action :set_student, only: %i[show update destroy]	

	  # Lists all students
	  def index
		@students = Student.all
		render json: @students
	  end

	  def show
		render json: @student
	  end

	  # Creates Student record
	  def create
		@student = Student.new(student_params)

		if @student.save
		  render json: @student, status: :created
		else
		  render json: @student.errors, status: :unprocessable_entity
		end
	  end

	  def update
		if @student.update(student_params)
		  render json: @student
		else
		  render json: @student.errors
		end
	  end

	  def search
		@query = params[:query]
		search_value = "%#{@query}%"
		@student_search = Student.where("name LIKE :search OR roll_no LIKE :search OR school LIKE :search", search: search_value)
		render json: @student_search
	  end

	  def destroy
		@student.destroy
	  end

	  private

	  def set_student
		@student = Student.find(params[:id])
	  end

	  def student_params
		params.require(:student).permit(:name, :email, :roll_no, :school)
	  end
	end
  end
end