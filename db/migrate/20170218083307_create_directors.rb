class CreateDirectors < ActiveRecord::Migration
  def change
    create_table :directors do |t|
      t.string :name
      t.string :name_ja

      t.timestamps null: false
    end
  end
end
