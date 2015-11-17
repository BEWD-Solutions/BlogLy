class PostsController < ApplicationController
	before_action :authenticate_user!, except: [:all, :show]

	def all
		if params[:q]
			@posts = Post.where("post_title LIKE ? OR post_text LIKE ?", "%#{params[:q]}%", "%#{params[:q]}%").order(created_at: :desc).paginate(:page => params[:page], :per_page => 4)
		else
			@posts = Post.all.order(created_at: :desc).paginate(:page => params[:page], :per_page => 4)
		end
	end

	def index
		@posts = Post.where(user_id: params[:user_id]).paginate(:page => params[:page], :per_page => 4)
	end

	def new
		@post = Post.new
		@user = User.find(params[:user_id])
	end

	def create
		post = User.find(params[:user_id]).posts.create(post_params)

		if post.valid?
			redirect_to user_posts_path(current_user.id)
		else
			flash[:error] = "Post could not be saved."
			redirect_to :back
		end
	end

	def show
		@post = Post.find(params[:id])
		@author = User.find(params[:user_id])

		@comment = Comment.new
		@comments = Comment.where(post_id: params[:id]).order(created_at: :desc)
	end

private

	def post_params
		params.require(:post).permit(:post_text, :cover_image, :post_title)
	end

end
