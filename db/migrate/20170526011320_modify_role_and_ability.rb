class ModifyRoleAndAbility < ActiveRecord::Migration[5.0]
  def change
    change_table :roles do |t|
      t.change :name, :string, null: false, unique: true
    end

    change_table :role_abilities do |t|
      t.remove :role_id
      t.remove :ability_id
      t.references :role, foreign_key: true 
      t.references :ability, foreign_key: true
    end

    change_table :abilities do |t|
      t.change :domain, :string, null: false
      t.change :ability, :string, null: false
    end

  end

end
