class ApplicationController < ActionController::Base
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception

	def default_pass
		@default_pass = 'Password123'
	end
	helper_method :default_pass

	def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end
	helper_method :current_user

	def authorize
		if current_user
			if (current_user.try(:authenticate, default_pass) && (flash[:notice].nil? && flash[:error].nil?) &&
				 !(params[:controller] == 'users' && (params[:action] == 'edit' || params[:action] == 'update')))
				flash[:error] = "Your password is not secure (default value)."
				redirect_to user_settings_path
			end
		else
			flash[:error] = "A valid Login is required to access this page."
			redirect_to login_path
		end
	end

	def render_404
		render file: "#{Rails.root.to_s}/public/404.html", status: 404, layout: true
	end
end
