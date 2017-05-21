class Role < ApplicationRecord
  has_many :users
  has_many :role_ability
  has_many :abilities, -> { distinct }, through: :role_ability

  validates :name, uniqueness: true, on: :create
end
