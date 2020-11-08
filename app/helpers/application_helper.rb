module ApplicationHelper
	include SessionsHelper
	
	def navigation
		out = []
		if current_user
			out << link_to(current_user.name, user_path(current_user), class: "nav-link text-secondary")
			out << link_to('Logout', logout_path, method: :delete, class: "nav-link text-secondary")
			out << link_to('Delete Account', user_path(current_user), method: :delete, data: { confirm: 'Are you sure?' }, class: "nav-link text-danger")
		else
			out << link_to('Login', login_path, class: 'nav-link text-secondary')
      out << link_to('Sign up', sign_up_path, class: 'nav-link text-secondary')
		end
		out.join("|").html_safe
	end

	def require_user
		if current_user.nil?
			redirect_to login_path
			flash[:danger] = "Login first"
		end
	end
end
