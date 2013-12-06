module CommentsHelper
	def authorized_to_delete_comment(post)
		current_user.posts.include?post
	end
end
