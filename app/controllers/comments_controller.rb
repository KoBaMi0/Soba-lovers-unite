class CommentsController < ApplicationController
    def create
        @comment = Comment.new()
        @post = Post.find(params[:post_id])
        save_comment = @post.comments.build(comment_params)

        if save_comment.save
            render "posts/show", status: :created
        else
            render "posts/show", status: :unprocessable_entity
        end
    end

    private

    def comment_params
        params.require(:comment).permit(:body).merge(user_id: current_user.id, post_id: params[:post_id])
    end
end
