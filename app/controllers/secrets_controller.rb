class SecretsController < ApplicationController
before_action :require_login, only: [:index, :create, :destroy]
	def index
  		@secrets = Secret.all
  	end

	def create
  		@secret = Secret.new(content: secret_params['content'], user: current_user)
  		if @secret.save
  			redirect_to user_path(@secret.user_id)
  		else
  			flash[:errors] = @secret.errors.full_messages
    	  	redirect_to user_path(@secret.user_id)
    	end
  	end

  	def destroy
  		secret = Secret.find(params[:id])
  		secret.destroy if secret.user == current_user
  		redirect_to user_path(current_user.id)
  	end

  	

	private
  	def secret_params
  		params.require(:secret).permit(:content, :user_id)
  	end
end
