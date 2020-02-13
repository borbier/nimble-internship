class Group < ApplicationRecord
  belongs_to :course

  has_many :group_user
  has_many :users, :through => :group_user
end
