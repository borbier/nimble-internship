class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :update, :destroy]

  def show
    params[:id] = params[:id].to_i
    @course = Course.find(params[:id])
  end

  def new
    @course = Course.new
    authorize @course
  end

  def create
    @course = Course.create course_params
    current_user.courses << Course.where(id: @course.id)
    redirect_to root_path
  end

  def destroy
    authorize @course
    if @course.destroy
      CourseUser.where(course_id: params[:id].to_i).destroy_all
      redirect_to root_path
    else
      flash.now[:alert] = "There was an error deleting the course."
      redirect_to course_path(id: params[:id])
    end
  end

  private 
  def course_params
    params.require(:course).permit(:name)
  end

  def set_course
    @course = Course.find(params[:id].to_i)
  end
end
