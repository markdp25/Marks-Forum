class ForumPost < ApplicationRecord
  belongs_to :forum_thread
  belongs_to :user
  has_many :comments
  accepts_nested_attributes_for :comments

  validates :body, presence: true

  def send_notifications!
    users = forum_thread.users.uniq - [user]
    users.each do |user|
      NotificationMailer.forum_post_notification(user, self).deliver_later
    end
  end
end
