class User < ApplicationRecord
    
  VALID_EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  has_secure_password
  validates_presence_of :password, length: { minimum: 6 }
  validates_presence_of :contact
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :contact, uniqueness: true, case_sensitive: false
  validates :role, presence: true
  enum role: [:association, :producer]

  before_create { email.downcase! }
end
