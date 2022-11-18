class ApplicationController < ActionController::Base
  add_flash_types :info, :success, :warning, :error
  before_action :require_login

  private

  def not_authenticated
    redirect_to login_path, info: 'ログインしてください'
  end

  def add_noindex_tag_to_response_headers
    response.headers['X-Robots-Tag'] = 'noindex'
  end
end
