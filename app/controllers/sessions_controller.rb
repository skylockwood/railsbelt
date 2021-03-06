class SessionsController < ApplicationController
	def new
		
	end

	def create
		@user = User.find_by_email(user_params[:email])
    	if @user && @user.authenticate(user_params[:password])
      		session[:user_id] = @user.id
      		redirect_to user_path(session[:user_id]), notice: "User successfully updated!"
    	else

      		redirect_to new_session_path, notice: "Invalid Credentials"
    	end
	end

	def destroy
		session[:user_id] = nil
    	redirect_to new_session_path, notice: "You have been logged out."
	end



	private
	def user_params
		params.require(:user).permit(:email, :password)
	end
end
