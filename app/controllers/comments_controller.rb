class CommentsController < ApplicationController
  load_and_authorize_resource

  def create
    #@post = Post.find(params[:post_id])
    #@comment = @post.comments.create(params[:comment], :user_id => current_user.id)
    @comment = Comment.new(params[:comment])
    @comment.post = Post.find(params[:post_id])
    @comment.user = current_user
    @comment.save
    redirect_to post_path(@comment.post)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end
end
