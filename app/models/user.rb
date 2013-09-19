class User < ActiveRecord::Base
  extend OmniauthCallbacks
  has_secure_password
  has_many :projects
  devise :token_authenticatable, :omniauthable
  before_save :ensure_authentication_token

end
