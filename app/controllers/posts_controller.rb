class PostsController < ApplicationController
before_action :authenticate_user!, except: [:index, :show] 

	def index
		@posts = Post.all.order("created_at DESC")
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		@post.like = 0
		@post.user_id = current_user.id
		if @post.save
			redirect_to post_path(@post)
		else
			render 'new'
		end
	end

	def show
		@post = Post.find(params[:id])
		@comment = Comment.new
		@user = User.new
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		if @post.update(post_params)
			redirect_to root_path
		else
			render 'edit'
		end
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to root_path
	end

	def update_like
		@post = Post.find(params[:id])
		@post.like += 1
		@post.save
		redirect_to root_path	
	end

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

	def post_params
		params.require(:post).permit(:title, :body, :user_id)
	end
end