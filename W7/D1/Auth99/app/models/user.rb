class User < ApplicationRecord
  validates :user_name, :session_token, :password_digest, presence: true
  validates :session_token, :user_name, uniqueness: true

  def reset_session_token!
    self.session_token = SecureRandom.base64(10)
  end

  def password=(password)
    @password = password
    self.password_digest = Bcrypt::Password.create(password)
  end

  def is_valid_password?(password)
    password_hash = Bcrypt::Password.new(self.password_digest)
    password_hash.is_password?(password)  
  end 

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    if user && user.is_valid_password?(password)
      return user 
    else
      return nil 
    end
  end

  
end
