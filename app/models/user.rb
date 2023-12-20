class User < ApplicationRecord
  has_many :prayers

  has_secure_password
  validates :email, presence: true, uniqueness: true
end
