class AddStartEndToTvPrograms < ActiveRecord::Migration[5.0]
  def change
    add_column :tv_programs, :on_air_start, :datetime
    add_column :tv_programs, :on_air_end, :datetime
  end
end
