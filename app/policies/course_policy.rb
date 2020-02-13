class CoursePolicy < ApplicationPolicy
  def new?
    return true if @current_user.role == 'teacher'
  end

  def destroy?
    return true if @current_user.role == 'teacher'
  end
  
  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
