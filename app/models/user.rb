class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: [:teacher, :student, :outsider]
  has_many :role_resources, dependent: :destroy

  has_many :course_users
  has_many :courses, through: :course_users

  has_many :group_users
  has_many :groups, through: :group_users
end