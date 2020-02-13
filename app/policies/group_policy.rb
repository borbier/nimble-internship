class GroupPolicy < ApplicationPolicy
  def new?
    return true if @current_user.role == 'teacher'
  end
  
  def update?
    return true if @current_user.role == 'teacher' || @current_user.role == 'student'
  end

  def addStudent?
    return true if @current_user.role == 'teacher'
  end

  def deleteStudent?
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
