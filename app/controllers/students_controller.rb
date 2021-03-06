class StudentsController < ApplicationController
  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
    @address = Address.new
    @address.student_id = @student.id
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    @student.save

    flash.notice = "Student #{@student.name} Created"

    redirect_to student_path(@student)
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])
    @student.update(student_params)

    redirect_to student_path(@student)
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy

    redirect_to students_path
  end

  private

  def student_params
    params.require(:student).permit(:name)
  end

end
