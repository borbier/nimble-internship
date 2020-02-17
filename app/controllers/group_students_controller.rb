class GroupStudentsController < ApplicationController
  before_action :set_course

  def new
    @students = User.where(role: 'student')
  end

  def create
    @student_append = User.find(params[:id].to_i)
    @student_append.courses << Course.find(params[:course_id].to_i)
    @student_append.groups << Group.find(params[:group_id].to_i)

    redirect_to course_group_path(:course_id => params[:course_id], :id => params[:group_id])
  end

  def destroy
    GroupUser.where(user_id: params[:id].to_i, group_id: params[:group_id].to_i).destroy_all
    CourseUser.where(user_id: params[:id].to_i, course_id: params[:course_id].to_i).destroy_all
    redirect_to course_group_path(:course_id => params[:course_id], :id => params[:group_id])
  end

  private
  def set_course
    @course = Course.find(params[:course_id].to_i)
  end

end
