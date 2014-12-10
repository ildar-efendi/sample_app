class PostsController < ApplicationController
	before_action :post, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, only: [:show, :create, :destroy, :new]


	def create
		puts params
		comment = post.comments.new(comment_params)
		comment.user = current_user
		if comment.save
			flash[:notice] = "Comment was successfully created"
		else
			flash[:notice] = "Comment was not created"
#		current_user.posts.create(post_params)
		redirect_to posts_path, notice: "Posts was successfully created!"
	end


	private
	def post
		@post ||= Post.find(params[:post_id])
	end

	def comment_params
		params.require(:comment).permit(:title, :message)
	end

	helper_method :post
end