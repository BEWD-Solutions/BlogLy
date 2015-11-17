class CommentsController < ApplicationController

	def create
		comment = current_user.comments.create(comment_params)

		if comment.valid?
			redirect_to :back
		else
			flash[:error] = "There was a problem saving the comment."
			redirect_to :back
		end
	end

private

	def comment_params
		params.require(:comment).permit(:comment_text, :post_id)
	end

end
