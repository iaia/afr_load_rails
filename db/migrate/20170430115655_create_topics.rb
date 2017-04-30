class CreateTopics < ActiveRecord::Migration[5.0]
  def change
    create_table :topics do |t|
      t.integer :tv_program_informations_id
      t.string :term

      t.timestamps
    end
  end
end
