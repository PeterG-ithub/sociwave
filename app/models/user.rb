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
  has_many :friends, ->(user) { unscope(:where).where('user_id = ? OR friend_id = ?', user.id, user.id) }
  has_many :likes

  devise :omniauthable, omniauth_providers: %i[github]
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.username = auth.info.name
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
    end
  end
end
