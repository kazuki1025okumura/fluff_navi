class ApplicationController < ActionController::Base
  ZOOM_LEVEL_SHOW_MAP = 15
  ZOOM_LEVEL_INDEX_MAP = 8.7
  LAT_INDEX_MAP = 35.509889
  LNG_INDEX_MAP = 139.409462
  ZOOM_LEVEL_TOKYO = 9.3
  ZOOM_LEVEL_KANAGAWA = 9.3
  LAT_TOKYO = 35.699627
  LNG_TOKYO = 139.468790
  LAT_KANAGAWA = 35.405050
  LNG_KANAGAWA = 139.367149


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
