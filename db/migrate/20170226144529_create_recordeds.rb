class CreateRecordeds < ActiveRecord::Migration[5.0]
  def change
    create_table :recordeds do |t|
      t.integer :user_id
      t.integer :tv_program_id
      t.boolean :recorded, default: true, null: false
      t.boolean :removed, default: false, null: false

      t.timestamps
    end
  end
end
