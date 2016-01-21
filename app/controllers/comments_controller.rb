class CommentsController < ApplicationController
def create_comment
		@post = Post.find(params[:id])
		@comment = Comment.new
		@user = User.new
		@comment.post_id = @post.id
		@comment.user_id = current_user.id
		@comment.content = params[:comment][:content]
		@comment.save
		redirect_to post_path(@post)
	end

	def delete_comment
		@comment = Comment.find(params[:id])
		post_id = @comment.post_id
		@comment.destroy
		redirect_to post_path(post_id)
	end 

	private

	def comment_param
		params.require(:comment).permit(:content, :post_id, :user_id)
	end
end