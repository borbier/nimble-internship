class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :update, :destroy]

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
    @course.destroy
    CourseUser.where(course_id: params[:id].to_i).destroy_all
    redirect_to root_path
  end

  private 
  def course_params
    params.require(:course).permit(:name)
  end

  def set_course
    @course = Course.find(params[:id].to_i)
  end
end
