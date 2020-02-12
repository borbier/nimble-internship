class Course < ApplicationRecord
  has_many :course_user
  has_many :users, :through => :course_user
  has_many :groups
end
