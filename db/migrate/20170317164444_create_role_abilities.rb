class CreateRoleAbilities < ActiveRecord::Migration[5.0]
  def change
    create_table :role_abilities do |t|
      t.int :role_id
      t.int :ability_id

      t.timestamps
    end
  end
end
