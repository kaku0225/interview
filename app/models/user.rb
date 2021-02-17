class User < ApplicationRecord
  before_create :encrypt_password

  validates :email, presence: true, uniqueness: true, format: { with: /[\w]+@([\w-]+\.)+[\w-]{2,4}/ }
  validates :password, presence: true, confirmation: true, length: { minimum: 4 }
  validates :nickname, presence: true

  private
    def encrypt_password
      self.password = Digest::SHA1.hexdigest("a#{self.password}Z")
    end
end
