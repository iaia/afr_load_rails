class CreateTvProgramInfomations < ActiveRecord::Migration[5.0]
  def change
    create_table :tv_program_infomations do |t|
      t.string :name
      t.integer :on_air_minutes

      t.timestamps
    end
  end
end
