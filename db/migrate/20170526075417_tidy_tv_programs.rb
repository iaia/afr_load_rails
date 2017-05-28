class TidyTvPrograms < ActiveRecord::Migration[5.0]
  def change
    change_table :tv_programs do |t|
      t.remove :title
      t.remove :title_ja 
      t.remove :director_id
      t.remove :released_year
      t.remove :country_id
      t.remove :leading_actor_id
      t.remove :supporting_actor_id
      t.remove :on_air_date
    end
  end
end
