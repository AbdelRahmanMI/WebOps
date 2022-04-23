class CommentsController < ApplicationController
    before_action :correct_user?, only: [:destroy_comment]
    before_action :authenticate_user!, only: [:create]

    def create
        if current_user != nil
            @post = Post.find(params[:post_id])
            @comment = @post.comments.new()
            @comment.content = params["content"]
            @comment.user_id = current_user.id
            @comment.save()
            redirect_to request.referrer
        else
            redirect_to new_user_session_url
        end
    end

    private

    def comment_params
        params.require(:comment).permit(:content, :post_id, :user_id)
    end

end
