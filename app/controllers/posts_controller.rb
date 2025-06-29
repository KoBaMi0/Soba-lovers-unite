class PostsController < ApplicationController
  def index
    @posts = Post.all
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

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def destroy
    post_destroy = Post.find(params[:id])

    if post_destroy.destroy
      redirect_to root_path
    else
      @post = Post.find(params[:id])
      @comment = Comment.new
      render :show, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :avatar, :body).merge(user_id: current_user.id)
  end
end
