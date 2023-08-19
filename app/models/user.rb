class User < ApplicationRecord
  validates :username, presence: true
  validates :username, uniqueness: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :posts
  has_many :comments
  has_many :sent_friend_requests, class_name: 'FriendRequest', foreign_key: :sender
  has_many :friend_requests, foreign_key: :receiver
end
