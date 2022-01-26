class CommentsController < ApplicationController
  before_action :set_post

  def create
    comment = @post.comments.create(comment_params)
    render json: comment
  end

  def update
    comment = Comment.find_by(id: params[:id])
    if comment_params[:like].present?
      if comment_params[:like]
        comment.like +=1
      else
        comment.like -=1 if comment.like > 0
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :like)
  end

  def set_post
    @post = Post.find_by(id: params[:post_id])
  end
end
