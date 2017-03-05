class Recorded < ApplicationRecord
    belongs_to :user
    belongs_to :tv_program
    validates :user_id,
        uniqueness: {scope: [:tv_program_id]}, on: :create

    def self.create_user_tvs(tvs, user)
        user = User.find(user.id)
        
        tvs.each do |tv|
            user.recordeds.find_or_create_by(tv_program_id: tv.id)
        end
    end
end
