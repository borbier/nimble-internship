class RemoveOwnerIdFromRoleResource < ActiveRecord::Migration[5.2]
  def change
    remove_column :role_resources, :owner_id, :string
  end
end
