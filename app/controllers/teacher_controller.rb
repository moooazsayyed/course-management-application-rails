class TeacherController < ApplicationController

  def index
    @teachers = Teacher.all
  end

  def show
    @teacher = Teacher.find(params[:id])
  end

  def new
    @teacher = Teacher.new
  end

  def create
    @teacher = Teacher.new(teacher_params)
    if @teacher.save
      redirect_to teachers_path
    else
      flash[:error] = "Failed to create teacher"
      render :new
    end
  end

  def edit
    @teacher = Teacher.find(params[:id])
  end

  def update
    @teacher = Teacher.find(params[:id])
    if @teacher.update(teacher_params)
      redirect_to @teacher
    else
      render :edit ,status: :unprocessable_entity
    end
  end

  def delete
    @teacher = Teacher.find(params[:id])
    @teacher.destroy
    redirect_to teachers_path
  end

  private

  def teacher_params
    params.require(:teacher).permit(:name, :course, :dept, :email)
  end
end
