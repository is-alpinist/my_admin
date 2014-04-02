class User < ActiveRecord::Base

validates_presence_of :email
validates :password, presence: true, length: { minimum: 3 }
validates :first, presence: true, length: { maximum: 50 }
VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
has_secure_password

end
