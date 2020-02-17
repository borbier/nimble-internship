class ChangeUserColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :firstName, :first_name
    rename_column :users, :lastName, :last_name
    rename_column :users, :citizenId, :citizen_id
  end
end
