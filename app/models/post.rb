class Post < ApplicationRecord
  validates :title, :body, presence: true
  validates :title, uniqueness: true
  belongs_to :user
  has_many :comments
  has_many :likes, as: :likable
end
