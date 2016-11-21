class User < ActiveRecord::Base
  has_secure_password
  has_many :bowling_bags
  validates :username, uniqueness: true
  validates :password, length: { minimum: 3 }
end