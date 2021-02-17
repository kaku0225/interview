class User < ApplicationRecord
  before_create :encrypt_password

  private
    def encrypt_password
      self.password = Digest::SHA1.hexdigest("a#{self.password}Z")
    end
end
