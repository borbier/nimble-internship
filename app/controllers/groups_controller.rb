class GroupsController < ApplicationController
  before_action :set_course
  
  def show
    params[:course_id] = params[:course_id].to_i
    @group = Group.find(params[:course_id])
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.create group_params
    @course.groups << @group
    redirect_to courses_path
  end

  def update
  end

  def delete
  end

  private
  def set_course
    @course = Course.find(params[:course_id].to_i)
  end

  def group_params
    params.require(:group).permit(:name)
  end
end
