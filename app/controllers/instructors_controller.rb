require "pry"

class InstructorsController < ApplicationController
  def index
    instructors = Instructor.all
    render json: instructors, include: :students
  end

  def create
    instructor = Instructor.create(instructor_params)
    render json: instructor, status: :created
  end

  def update
    instructor = Instructor.find(params[:id])
    instructor.update(instructor_params)
    render json: instructor
  end

  def destroy
    instructor = Instructor.find(params[:id])
    instructor.destroy
  end

private

  def instructor_params
    params.require(:instructor).permit(:name)
  end
end
