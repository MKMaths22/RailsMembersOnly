class User < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :password, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true
  has_many :posts
end
