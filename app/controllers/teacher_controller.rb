class TeacherController < ApplicationController

  def index
    @teachers = Teacher.all
  end

  def new
    @teacher = Teacher.new
  end

  def create
    @teacher = Teacher.new(teacher_params)
    if @teacher.save
      redirect_to teachers_path
    else
      render :new
    end
  end

  def edit
    @teacher = Teacher.find[params[:id]]
  end

  def updated
    @teacher =  Teacher.find[params[:id]]
    if @teacher.update[teacher_params]
      redirect_to @teacher
    else
      redirect_to :edit
    end
  end

  def delete
    @employee = Teacher.find(params[:id])
    @employee.destroy
    redirect_to employees_path
  end

  private
  def teacher_params
    params.require(:teacher).permit(:name, :course, :dept ,:email)
  end
end
