class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :role_resources, :resType, :res_type
    rename_column :role_resources, :resValue, :res_value
  end
end
