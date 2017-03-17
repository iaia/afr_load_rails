class Role < ApplicationRecord
    belongs_to :user

    has_many :roles_abilities
    has_many :abilities, -> {distinct}, through: :roles_abilities

end
