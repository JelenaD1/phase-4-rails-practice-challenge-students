require "pry"

class StudentsController < ApplicationController
  def index
    if params[:instructor_id]
        students = Student.where(instructor_id: params[:instructor_id])
    else
    students = Student.all 
    end 
    render json: students, include: :instructor
  end

  def create
    student = Student.create(student_params)
    render json: student
  end

  def update
    student = Student.find(params[:id])
    student.update(student_params)
    render json: student
  end

  def destroy
    student = Student.find(params[:id])
    student.destroy
  end

private

  def student_params
    params.require(:student).permit(:name, :major, :age, :instructor_id)
  end
end
