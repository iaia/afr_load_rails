class RenameTvProgramInformationToTopics < ActiveRecord::Migration[5.0]
  def change
    rename_column :topics, :tv_program_informations_id, :tv_program_infomation_id
  end
end
