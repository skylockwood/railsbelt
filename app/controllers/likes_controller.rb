class LikesController < ApplicationController
	before_action :require_login
	before_action :require_correct_user, only: [:show, :edit, :update, :destroy]
	def create
		@user = User.find(session[:user_id])
		@secret = Secret.find(params[:secret_id])
		Like.create(user: @user, secret: @secret)
		redirect_to secrets_path
	end

	def destroy
		like = Like.find_by(user_id: session[:user_id], secret_id: params[:id])
		like.destroy
		redirect_to secrets_path
	end
end
