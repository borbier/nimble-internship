class CoursesController < ApplicationController
  def index
  end

  def show
    params[:id] = params[:id].to_i
    @course = Course.find(params[:id])
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.create course_params
    current_user.courses << Course.where(id: @course.id)
    redirect_to root_path
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private def course_params
    params.require(:course).permit(:name)
  end
end
