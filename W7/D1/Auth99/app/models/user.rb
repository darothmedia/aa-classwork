class User < ApplicationRecord
  validates :user_name, :session_token, :password_digest, presence: true
  validates :session_token, :user_name, uniqueness: true

  def reset_session_token!
    @token = SecureRandom.base64(10)
  end

  def password=(password)
    @password = password
    self.password_digest = Bcrypt::Password.create(password)
  end

  def is_password?(password)
    password_hash = Bcrypt::Password.new(self.password_digest)
    password_hash == Bcrypt::Password.create(password)
  end

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
  end

end
