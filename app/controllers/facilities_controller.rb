class FacilitiesController < ApplicationController
  skip_before_action :require_login, only: %i[index show animal category all search]
  before_action :set_center_of_show_map, only: %i[show]
  before_action :set_center_of_bookmarks_map, only: %i[bookmarks animal category all]
  before_action :add_noindex_tag_to_response_headers, only: %i[bookmarks]

  def index
    @search_form = SearchForm.new(search_params)
    @facilities = @search_form.search.order(id: :desc)
    gon.facilities = @facilities.as_json(include: :categories)
    set_center_of_index_map
  end

  def show
    @facility = Facility.find(params[:id])
    gon.facilities = [@facility].as_json(include: :categories)
  end

  def bookmarks
    @bookmark_facilities = current_user.facilities.includes(%i[facility_categories categories managements animals posts]).order(created_at: :desc)
    gon.facilities = @bookmark_facilities.as_json(include: :categories)
  end

  def animal
    @animal = Animal.find(params[:id])
    @facilities = @animal.facilities.includes(%i[facility_categories categories managements animals posts])
    gon.facilities = @facilities.as_json(include: :categories)
  end

  def category
    @category = Category.find(params[:id])
    @facilities = @category.facilities.includes(%i[managements animals categories facility_categories posts])
    gon.facilities = @facilities.as_json(include: :categories)
  end

  def all
    @facilities = Facility.all.includes(%i[facility_categories categories managements animals posts]).order(id: :desc)
    gon.facilities = @facilities.as_json(include: :categories)
  end

  def search; end

  private

  def search_params
    params[:q]&.permit(:name, :description, :address, :prefecture_id, :category_id, :animal_id)
  end

  # 詳細画面のマップの中心とズームレベル
  def set_center_of_show_map
    @facility = Facility.find(params[:id])
    gon.center_lat = @facility.latitude
    gon.center_lng = @facility.longitude
    gon.zoom_level = ZOOM_LEVEL_SHOW_MAP
  end

  # お気に入り一覧画面のマップの中心とズームレベル
  def set_center_of_bookmarks_map
    gon.center_lat = LAT_INDEX_MAP
    gon.center_lng = LNG_INDEX_MAP
    gon.zoom_level = ZOOM_LEVEL_INDEX_MAP
  end

  def set_center_of_index_map
    case @search_form.prefecture_id
    when 13
      gon.center_lat = LAT_TOKYO
      gon.center_lng = LNG_TOKYO
      gon.zoom_level = ZOOM_LEVEL_TOKYO
    when 14
      gon.center_lat = LAT_KANAGAWA
      gon.center_lng = LNG_KANAGAWA
      gon.zoom_level = ZOOM_LEVEL_KANAGAWA
    else
      gon.center_lat = LAT_INDEX_MAP
      gon.center_lng = LNG_INDEX_MAP
      gon.zoom_level = ZOOM_LEVEL_INDEX_MAP
    end
  end
end
