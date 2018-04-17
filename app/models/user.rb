class User < ApplicationRecord
  attr_accessor :remember_token
  before_save { self.email = email.downcase }
  before_save { self.name = name.downcase }
  validates :name, presence: true, length: { maximum: 15 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :languages, presence: true
  validates :country, presence: true

  enum permission_level: {user: 0, moderator: 100, admin: 9999}
  has_secure_password
  belongs_to :country, optional: true

  has_many :user_languages, dependent: :destroy
  has_many :languages, :through => :user_languages

  has_many :ingredients, foreign_key: :added_by
  has_many :nutritional_infos, foreign_key: :added_by

  has_many :recipes, foreign_key: :added_by

  has_many :received_reports, class_name: 'ReportCase', as: :reported, dependent: :destroy
  has_many :filed_reports, class_name: 'ReportCase', dependent: :destroy

  has_many :subscribers, class_name: 'Subscription', as: :subscribed_to, dependent: :destroy
  has_many :subscriptions, dependent: :destroy

  has_many :cook_books, foreign_key: :added_by, dependent: :destroy

  has_many :uploaded_images, foreign_key: :added_by, class_name: 'Image', dependent: :destroy
  has_many :profile_pictures, class_name: 'Image', as: :depicted, dependent: :destroy

  has_many :votes, dependent: :destroy
  
  accepts_nested_attributes_for :user_languages

  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
    BCrypt::Password.create(string, cost: cost)
  end

  def self.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def authenticated?(remember_token)
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

end
