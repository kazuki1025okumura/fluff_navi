class UsersController < ApplicationController
  skip_before_action :require_login, only: %i[new create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login(user_params[:email], user_params[:password], params[:remember])
      redirect_to root_path, success: t('.success')
    else
      flash.now[:error] = t('.error')
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
