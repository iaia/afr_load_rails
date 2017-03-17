class CreateRoleAbilities < ActiveRecord::Migration[5.0]
  def change
    create_table :role_abilities do |t|
      t.integer :role_id
      t.integer :ability_id

      t.timestamps
    end
  end
end
