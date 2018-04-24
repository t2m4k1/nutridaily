class User < ApplicationRecord
  attr_accessor :remember_token

  before_save { self.email = email.downcase }
  before_save { self.name = name.downcase }
  validates :name, presence: true, length: { maximum: 15 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :authentication_id, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
  validates :country, presence: true
  enum permission_level: {user: 0, moderator: 100, admin: 9999}

  has_secure_password
  has_secure_token :authentication_id

  belongs_to :country

  has_many :remember_digests, dependent: :destroy

  has_many :ingredients, foreign_key: :added_by
  has_many :nutritional_infos, foreign_key: :added_by

  has_many :recipes, foreign_key: :added_by

  has_many :received_reports, class_name: 'ReportCase', as: :reported, dependent: :destroy
  has_many :filed_reports, class_name: 'ReportCase', dependent: :destroy

  has_many :subscribers, class_name: 'Subscription', as: :subscribed_to, dependent: :destroy
  has_many :subscriptions, dependent: :destroy

  has_many :cook_books, foreign_key: :added_by, dependent: :destroy

  has_many :uploaded_images, foreign_key: :added_by, class_name: 'Image', dependent: :destroy
  has_many :images, class_name: 'Image', as: :depicted, dependent: :destroy

  has_many :votes, dependent: :destroy
  
  accepts_nested_attributes_for :images
  
  def find_fitting_digest(remember_token)
    self.remember_digests.each do |remember_digest|
        if !remember_token.nil? && BCrypt::Password.new(remember_digest.digest).is_password?(remember_token)
            return remember_digest
        end
    end
    nil
  end

  def forget_token(remember_token)
    if @active_token = find_fitting_digest(remember_token)
        @active_token.destroy
    else
        puts 'cant find token'
        puts RememberDigest.digest(remember_token)
    end
  end

  def forget_all_tokens
    self.remember_digests.destroy_all
  end

  def append_remember
    self.remember_token = RememberDigest.new_token
    self.remember_digests << RememberDigest.new(digest: RememberDigest.digest(remember_token))
    self.remember_token
  end

  def authenticated?(remember_token)
    if @digest = find_fitting_digest.nil?
        @digest.refresh_last_login_timestamp
    end
  end

end
