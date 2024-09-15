class StudentsController < ApplicationController
def index
  @students = Student.all
end

def new
  @student = Student.new
end

def show
  @student = Student.find(params[:id])
end

def create
  @student = Student.new(student_params)
  if @student.save
    flash[:success] = "Created successfully"
    redirect_to students_path
  else
    render :new
  end
end

def edit
  @student = Student.find(params[:id])
end

def update
  @student = Student.find(params[:id])
  if @student.update(student_params)
    redirect_to @student
  else
    redirect_to :edit, status: :unprocessable_entity
  end
end

def delete
  @student = Student.find(params[:id])
  if @student.delete
    redirect_to students_path, notice: 'Student was successfully deleted.'
  else
    redirect_to students_path, notice: 'Failed.'
  end
end

end

private
def student_params
  params.require(:student).permit(:name, :course, :dept ,:div ,:year ,:email )
end
