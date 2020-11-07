module SessionsHelper
	def log_in(user)
		session[:user_id] = user.id
	end

	def current_user
		@current_user ||= User.find_by(id: session[:user_id])
	end

	def log_out
		@current_user = nil
		session[:user_id] = nil
	end

	def user_check
		if current_user
			flash[:danger] = "Already logged in!"
			redirect_to root_path
		end
	end
end
