class GroupsController < ApplicationController
  before_action :set_course
  before_action :set_group, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @group = Group.new
    authorize @group
  end

  def create
    @group = Group.create group_params
    @course.groups << @group
    redirect_to course_path(:id => params[:course_id])
  end

  def edit
  end
  
  def update
    authorize @group
    if @group.update(group_params)
      redirect_to course_group_path, notice: "Group name updated"
    else
      render :edit
    end
  end

  def put
  end
  
  def delete
  end

  def destroy
    GroupUser.where(group_id: params[:id].to_i).destroy_all
    @group.destroy
    redirect_to course_path(:id => params[:course_id])
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
