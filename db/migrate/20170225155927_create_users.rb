class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :nickname

      t.index [:name], unique: true

      t.timestamps
    end
  end
end
