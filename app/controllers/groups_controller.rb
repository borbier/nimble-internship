class GroupsController < ApplicationController
  before_action :set_course
  before_action :set_group, only: [:show, :edit, :update]

  def show
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.create group_params
    @course.groups << @group
    redirect_to courses_path
  end

  def edit
  end
  
  def update
    if @group.update(group_params)
      redirect_to course_group_path, notice: "Group name updated"
    else
      render :edit
    end
  end

  def addStudent
    @students = User.where(role: 'student')
  end

  def updateAddStudent
    @student_append = User.find(params[:id].to_i)
    @student_append.courses << Course.find(params[:course_id].to_i)
    @student_append.groups << Group.find(params[:group_id].to_i)

    redirect_to course_group_path(:course_id => params[:course_id], :id => params[:group_id])
  end

  def deleteStudent
    puts params[:course_id]
    puts params[:group_id]
    puts params[:id]
    GroupUser.where(user_id: params[:id].to_i, group_id: params[:group_id].to_i).destroy_all
    CourseUser.where(user_id: params[:id].to_i, course_id: params[:course_id].to_i).destroy_all
    redirect_to course_group_path(:course_id => params[:course_id], :id => params[:group_id])
  end

  def put
  end
  
  def delete
  end

  private
  def set_course
    @course = Course.find(params[:course_id].to_i)
  end

  def set_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:name)
  end
end
