class UserSetting < ApplicationRecord
  belongs_to :user
  after_initialize :set_default

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :mail_address, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }, if: :apply_editor_permission?

  def apply_editor_permission?
     self.apply_editor_permission == true 
  end

  def set_default
    self.is_tweet ||= true
    self.is_post_on_facebook ||= true
    self.apply_editor_permission ||= false
  end


end
