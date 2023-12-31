class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :password, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true
  has_many :posts
end
