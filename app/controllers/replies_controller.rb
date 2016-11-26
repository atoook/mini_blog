class RepliesController < ApplicationController

  def new
    @reply = Reply.new
  end

  def create
  @reply = Reply.new
  @reply.comment = params[:comment]
  @reply.blog_id = params[:id]
  @reply.save
  redirect_to controller: :blogs, action: :show
  end

  def index
  @replies = Replay.all.order(created_at: :desc)
  end

end
