class Comment < ApplicationRecord
  belongs_to :forum_post
  belongs_to :user
  attr_accessor :title, :body, :author
  acts_as_tree order: 'created_at DESC'

  validates :body, length: { minimum: 5 }, presence: true
  validates :user, presence: true
end
