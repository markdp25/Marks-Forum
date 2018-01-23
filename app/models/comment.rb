class Comment < ApplicationRecord
  belongs_to :forum_post

  belongs_to :user

  validates :body, length: { minimum: 5 }, presence: true
  validates :user, presence: true

end
