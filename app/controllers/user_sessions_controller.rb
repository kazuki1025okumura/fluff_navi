class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: %i[new create guest_login]

  def new; end

  def create
    @user = login(params[:email], params[:password], params[:remember])
    if @user
      redirect_back_or_to root_path, success: t('.success')
    else
      flash.now[:error] = t('.error')
      render :new
    end
  end

  def destroy
    if current_user.guest?
      current_user.destroy!
    else
      logout
    end
    redirect_to root_path, success: t('.success')
  end

  def guest_login
    random_name = SecureRandom.hex(5)
    user = User.create!(name: 'ゲストユーザー', email: "guest_#{random_name}@example.com", password: random_name, password_confirmation: random_name, role: :guest)
    auto_login(user)
    redirect_to root_path, success: 'ゲストユーザーとしてログインしました'
  end
end
