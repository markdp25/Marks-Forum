class NotificationMailer < ApplicationMailer::Base
  default from: 'from@example.com'

  def forum_post_notification(user, forum_post)
    @forum_post = forum_post
    @user = user

    mail(
      to: "#{user.email}",
      subject: "[New Programmer's Forum] New Post in #{forum_post.forum_thread.subject}"
    )
  end

end
