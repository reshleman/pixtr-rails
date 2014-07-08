class User < ActiveRecord::Base
  has_many :galleries
  has_many :comments

  validates :email, presence: true
  validates :password_digest, presence: true
end
