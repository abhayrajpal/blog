class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update]
  
  def index
    posts = Post.all
    render json: posts
  end

  def create
    post = Post.new(post_params)
    if post.save
      render json: post
    else
      render json: "Post can't be created"
    end
  end

  def update
    if post_params[:like].present?
      if post_params[:like]
        @post.like +=1
      else
        @post.like -=1 if @post.like > 0
      end
      @post.save
    else
      @post.update(post_params)
    end

    render json: @post
  end

  def show
    render json: {post: @post, comments: @post.comments}
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :like)
  end

  def set_post
    @post = Post.find_by(id: params[:id])
  end
end
