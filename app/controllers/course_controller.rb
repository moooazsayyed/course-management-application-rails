class CourseController < ApplicationController

  def index
    @courses = Course.all
  end

  def new
    @courses = Course.new
  end

  def create
    @courses = Course.new(course_params)
    if @courses.save
      redirect_to students_path
    else
      render :new
    end
  end

  def edit
    @courses = Course.find[params[:id]]
  end

  def updated
    @courses =  Course.find[params[:id]]
    if @courses.update[course_params]
      redirect_to @courses
    else
      redirect_to :edit
    end
  end

  def delete
    @courses = Course.find(params[:id])
    @courses.destroy
    redirect_to employees_path
  end

  private
  def course_params
    params.require(:course).permit(:name, :dept )
  end


end
