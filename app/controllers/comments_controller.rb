class CommentsController < ApplicationController
  def index
    @comments = Comment.hash_tree
  end

  def new
    @comment = Comment.new(comment_params)

  end

  def create
    @comment.user = current_user
    if params[:comment][:parent_id].to_i > 0
    parent = Comment.find_by_id(params[:comment].delete(:parent_id))
    @comment = parent.children.build(comment_params)
  else
    @comment = Comment.new(comment_params)
  end

  if @comment.save
    flash[:success] = 'Your comment was successfully added!'
    redirect_to forum_threads_path
  else
    render 'new'
  end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

end
