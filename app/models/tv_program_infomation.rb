class TvProgramInfomation < ApplicationRecord
    has_many :topics, -> {distinct}
end
