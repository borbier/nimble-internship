class GroupController < ApplicationController
  def new
    @group = Group.new
  end

  def create
    @group = Group.create group_params
    group.courses << @course
  end

  private def group_params
    params.require(:group).permit(:name)
  end
end
