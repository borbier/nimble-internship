class AddUserToRoleResource < ActiveRecord::Migration[5.2]
  def change
    add_reference :role_resources, :user, foreign_key: true
  end
end
