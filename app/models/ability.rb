class Ability < ApplicationRecord
    has_many :role_ability
    has_many :roles, -> {distinct}, through: :role_ability
end
