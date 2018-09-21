class DashboardController < ApplicationController
	before_action :get_user, except: :destroy

	def index
	end

	def new
		if @user
			render dashboard_index_path
		end
	end
	
	def create
		validUser = User.like_username(params[:username])
		if validUser && validUser.count == 1
			validUser = validUser.first
		elsif params[:username].blank? || params[:password].blank?
			flash[:error] = "Username or Password cannot be blank."
			redirect_to login_url and return
		elsif validUser.empty? && params[:username]
			flash[:error] = "Invalid Username or Password."
			redirect_to login_url and return
		else
			flash[:error] = "An error occurred when grabbing your details.\nPlease contact support, referencing Error Code: 409"
			redirect_to login_url and return
		end

		if validUser && validUser.authenticate(params[:password])
			session[:user_id] = validUser.id
			current_user = validUser
			if params[:password] == 'test1'
				redirect_to user_settings_path, notice: "Please update your Password!"
			else
				redirect_to dashboard_index_path, notice: "Logged in!"
			end
		else
			flash[:error] = "Invalid Username or Password."
			redirect_to login_url
		end
	end

	def destroy
		if current_user
			session[:user_id] = nil
			current_user = nil
		end
		redirect_to root_url, notice: "Logged out!"
		cookies.delete(:login, domain: :all)
	end

	private
		def get_user
			@user = current_user

			if @user && (cookies[:login].nil? || @user.username != cookies.signed[:login])
				cookies.signed[:login] = {
					value: @user.username,
					expires: 3.day.from_now,
					domain: :all
				}
			end

			if @user
				if @user.full_name
					@page_welcome = "Welcome, #{@user.full_name}"
				else
					@page_welcome = "Welcome, #{@user.username}"
				end
			end
		end
end