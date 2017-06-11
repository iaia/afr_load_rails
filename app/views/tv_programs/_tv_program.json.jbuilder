json.extract! tv_program, :id, :on_air_start, :on_air_end
json.watched tv_program.watched, :id, :watched if tv_program.watched
json.movie tv_program.movie, :id, :title, :title_ja
