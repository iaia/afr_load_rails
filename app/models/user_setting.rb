class UserSetting < ApplicationRecord
  belongs_to :user
  after_initialize :set_default
  def set_default
    self.is_tweet = true if is_tweet.nil?
    self.is_post_on_facebook = true if is_post_on_facebook.nil?
  end
end
