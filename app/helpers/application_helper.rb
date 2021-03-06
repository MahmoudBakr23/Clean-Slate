module ApplicationHelper
	include SessionsHelper
	
	def navigation
		out = []
		if current_user
			out << link_to("Profile", user_path(current_user), class: "nav-link text-secondary")
			out << link_to('Logout', logout_path, method: :delete, class: "nav-link text-danger")
			out << link_to('Delete Account', user_path(current_user), method: :delete, data: { confirm: 'Are you sure?' }, class: "nav-link text-danger")
		else
			out << link_to('Login', login_path, class: 'nav-link text-secondary')
      		out << link_to('Sign up', sign_up_path, class: 'nav-link text-secondary')
		end
		out.join().html_safe
	end

	def show_user_name
		current_user.name if !current_user.nil?
	end

	def require_user
		if current_user.nil?
			redirect_to login_path
			flash[:danger] = "Login first"
		end
	end

	def like_and_unlike(article)
		like = Like.find_by(article: article, author: current_user)
		if like
			link_to('Unvote✖', article_like_path(id: like.id, article_id: article.id), method: :delete)
		else
			link_to('Vote✔', article_likes_path(article_id: article.id), method: :post)
		end
	end

	def count_votes(article)
		if !article.likes.empty?
			article.likes.count
		else
			return
		end
	end

	# def show_voters(article)
	# 	out = []
	# 	if current_user.likes.include?(article)
	# 		return
	# 	else
	# 		article.likes.each do |like|
	# 			out << link_to(like.author.name, user_path)
	# 		end
	# 	end
	# 	out.join(", ").html_safe
	# end

	# def limited_top_voted(article) {
	# 	Article.all.each do |article|
	# 		if article.likes.count = article.likes.count
	# 	end
	# }
end
