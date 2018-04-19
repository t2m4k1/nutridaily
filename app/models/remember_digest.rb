class RememberDigest < ApplicationRecord
  before_save :refresh_last_login_timestamp
  belongs_to :user
  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
    BCrypt::Password.create(string, cost: cost)
  end

  def self.new_token
    SecureRandom.urlsafe_base64
  end

  def refresh_last_login_timestamp
    self.last_login = DateTime.now
  end
end
