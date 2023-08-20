class Friend < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  validates :user, uniqueness: { scope: :friend, message: 'Already Friends' }
end
