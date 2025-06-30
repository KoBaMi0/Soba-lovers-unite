class CommentsController < ApplicationController
    before_action :set_reloading_data

    def create
        save_comment = @post.comments.build(comment_params)

        if save_comment.save
            render "posts/show", status: :created
        else
            render "posts/show", status: :unprocessable_entity
        end
    end

    def destroy
        comment_destroy = Comment.find(params[:id])

        if comment_destroy.destroy
            render "posts/show", status: :created
        else
            render "posts/show", status: :bad_request
        end
    end

    private

    def comment_params
        params.require(:comment).permit(:body).merge(user_id: current_user.id, post_id: params[:post_id])
    end

    def set_reloading_data
        @comment = Comment.new()
        @post = Post.find(params[:post_id])
        @comments = @post.comments.includes(:user)
  end
end
