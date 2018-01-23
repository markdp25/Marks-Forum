class CommentsController < ApplicationController
  def form
     respond_to do |format|
       format.html {}
       format.js
     end
  end

  def create
     @forum_post = ForumPost.find(params[:id])
     comment = @forum_post.comments.new(comment_params)
     comment.user = current_user

     if comment.save
       flash[:notice] = "Comment saved successfully."
       redirect_to [@forum_thread.subject, @forum_thread]
     else
       flash[:alert] = "Comment failed to save."
       redirect_to [@forum_thread.subject, @forum_thread]
     end
   end

  def destroy
  end

  private

   def comment_params
     params.require(:comment).permit(:body)
   end
end
