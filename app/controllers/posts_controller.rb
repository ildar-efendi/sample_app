class PostsController < ApplicationController
	before_action :post, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, only: [:show, :create, :destroy, :new]


	def create
		puts params
		current_user.posts.create(post_params)
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