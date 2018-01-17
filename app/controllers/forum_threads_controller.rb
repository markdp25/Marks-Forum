class ForumThreadsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_forum_thread, except: [:index, :new, :create]

  def index
    @forum_threads = ForumThread.all
  end

  def show

  end

  def new
    @forum_thread = ForumThread.new
    @forum_thread.forum_posts.new
  end

  def create
    @forum_thread = ForumThread.new(params[:id])
    @forum_thread.assign_attributes(forum_thread_params)

    if @forum_thread.save
      redirect_to @forum_thread, notice: "Forum thread was created."
    else
      flash.now[:alert] = "Error creating Forum."
      render :new
    end
  end

  private
    def set_forum_thread
      @forum_thread = ForumThread.find(params[:id])
    end

    def forum_thread_params
      params.require(:forum_thread).permit(:subject, forum_posts_attributes: [:body])
    end
end
