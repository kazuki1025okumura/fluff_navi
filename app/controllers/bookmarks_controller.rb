class BookmarksController < ApplicationController
  prepend_before_action :set_url

  def create
    @facility = Facility.find(params[:facility_id])
    current_user.bookmark(@facility)
  end

  def destroy
    @facility = current_user.bookmarks.find(params[:id]).facility
    current_user.unbookmark(@facility)
  end

  private

  def set_url
    session[:return_to_url] = request.referer
  end
end
