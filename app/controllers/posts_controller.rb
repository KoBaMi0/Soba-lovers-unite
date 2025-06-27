class PostsController < ApplicationController
  def index
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.new(post_params)
    if post.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end
end
