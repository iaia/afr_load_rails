class RoleAbility < ApplicationRecord
  belongs_to :role
  belongs_to :ability

  validates :role_id, uniqueness: {scope: :ability_id}, on: :create
end
