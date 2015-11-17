module PostsHelper

	def get_author_name(user_id)
		user = User.find(user_id)

		return user.first_name + " " + user.last_name
	end

end
