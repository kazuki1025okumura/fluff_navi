class FacilitiesController < ApplicationController
  skip_before_action :require_login, only: %i[index show]
  before_action :set_center_of_show_map, only: %i[show]
  before_action :set_center_of_bookmarks_map, only: %i[index bookmarks]

  def index
    @search_form = SearchForm.new(search_params)
    @facilities = @search_form.search.order(id: :desc)
    gon.facilities = @facilities.as_json(include: :categories)
  end

  def show
    @facility = Facility.find(params[:id])
    gon.facilities = [@facility].as_json(include: :categories)
  end

  def bookmarks
    @bookmark_facilities = current_user.facilities.includes(%i[facility_categories categories managements animals]).order(created_at: :desc)
    gon.facilities = @bookmark_facilities.as_json(include: :categories)
  end

  private

  def search_params
    params[:q]&.permit(:name, :description, :address, :prefecture_id, :category_id, :animal_id)
  end

  def set_center_of_show_map
    @facility = Facility.find(params[:id])
    gon.center_lat = @facility.latitude
    gon.center_lng = @facility.longitude
    gon.zoom_level = 15
  end

  def set_center_of_bookmarks_map
    gon.center_lat = 35.509889
    gon.center_lng = 139.409462
    gon.zoom_level = 9.6
  end
end
