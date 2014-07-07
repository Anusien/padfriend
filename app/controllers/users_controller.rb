class UsersController < ApplicationController
  def index
  	if signed_in?
		redirect_to current_user
	else	
		redirect_to signin_path
	end
  end

  def show 
  	#@user = User.find_by(name: params[:id])
	@user = User.find(params[:id])
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
	if @user.save
		flash[:success] = "Welcome to Padfriend!"
		redirect_to @user
	else
		render 'new'
	end
  end

  private
  	def user_params
		params.require(:user).permit(:name, :email, :friendcode,
			:password, :password_confirmation)
	end
end
