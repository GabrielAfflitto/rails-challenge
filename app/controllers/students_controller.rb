class StudentsController < ApplicationController
  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
  end

  def new
    @student = Student.new
  end

  def create
    binding.pry
  end

  private

  def student_params
    params.require(:student).permit(:name)
  end

end
