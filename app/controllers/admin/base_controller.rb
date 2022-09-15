class Admin::BaseController < ApplicationController
  before_action :check_admin

  private

  def not_authenticated
    flash[:warning] = 'ログインしてください'
    redirect_to admin_login_path
  end

  # ↓ユーザーが管理者権限を持っているか確認する
  def check_admin
    redirect_to root_path, error: '権限がありません' unless current_user.admin?
  end
end
