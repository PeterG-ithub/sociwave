class Like < ApplicationRecord
  belongs_to :likable, polymorphic: true
  belongs_to :user

  validates :user, uniqueness: { scope: :likable, message: 'Already liked this' }
end
