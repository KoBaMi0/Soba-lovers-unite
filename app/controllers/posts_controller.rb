class PostsController < ApplicationController
  before_action :require_login, only: [ :show ]

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
    @comments = @post.comments.includes(:user)
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

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :avatar, :body).merge(user_id: current_user.id)
  end

end
