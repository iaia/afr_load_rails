class Ability < ApplicationRecord
  has_many :role_ability
  has_many :roles, -> { distinct }, through: :role_ability

  validates :domain, uniqueness: { scope: [:ability] }, on: :create
end
