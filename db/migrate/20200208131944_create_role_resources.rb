class CreateRoleResources < ActiveRecord::Migration[5.2]
  def change
    create_table :role_resources do |t|
      t.string :name
      t.string :resType
      t.string :resValue
      t.references :owner

      t.timestamps
    end
  end
end
