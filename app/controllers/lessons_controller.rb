class LessonsController < ApplicationController

  def index
    @lessons = Lesson.all.order(:name)
  end

  def show
    @lesson = Lesson.find(params[:id])
  end

  def new
    @lesson = Lesson.new
  end

  def edit
    @lesson = Lesson.find(params[:id])
  end

  def update
    @lesson = Lesson.find(params[:id])
    if @lesson.update(lesson_params)
      redirect_to @lesson
    else
      redirect_to @lesson, alert: "Your Changes were not saved"
    end
  end

  def create
    @lesson = Lesson.new(lesson_params)

    if @lesson.save
      redirect_to @lesson
    else
      redirect_to new_lesson_path, alert: "Please try again"
    end
  end

  def destroy
    @lesson = Lesson.find(params[:id])
    if @lesson.destroy!
      redirect_to lessons_path
    end
  end

  private

  def lesson_params
    params.require(:lesson).permit(:name, :props)
  end
end
