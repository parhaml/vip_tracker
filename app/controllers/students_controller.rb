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
    @student = Student.new(student_params)

    if @student.save
      redirect_to @student
    else
      redirect_to new_student_path, alert: "Please try again"
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
      redirect_to @student, alert: "Your Changes were not saved"
    end
  end

  def destroy
    @student = Student.find(params[:id])
    if @student.destroy!
      redirect_to students_path
    end
  end

  def add
    @student = Student.find(params[:id])
    @lessons = Lesson.all
  end

  def teach
    @student = Student.find(params[:id])
    @lesson = Lesson.find(params[:lesson]["name"].to_i)
    if @student.lessons << @lesson
      redirect_to @student, alert: "Lesson added successfully!"
    else
      redirect_to @student, alert: "Your Change was not saved"
    end
  end


private
  def student_params
    params.require(:student).permit(:name, :age, :birthday, :picture)
  end
end
