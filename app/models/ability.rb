class Ability < ApplicationRecord
  has_many :role_ability
  has_many :roles, -> { distinct }, through: :role_ability

  validates :domain, uniqueness: { scope: [:ability] }, on: :create

  def method_missing(method, *args)
  end

  def index?
    ability == "index"
  end
end
