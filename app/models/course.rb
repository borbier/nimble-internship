class Course < ApplicationRecord
  has_many :course_users
  has_many :users, through: :course_users
  has_many :groups
end
