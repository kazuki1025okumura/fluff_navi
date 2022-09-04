class FacilitiesController < ApplicationController
  skip_before_action :require_login, only: %i[index show]
  def index
    @search_form = SearchForm.new(search_params)
    @facilities = @search_form.search.order(id: :desc)
  end

  def show
    @facility = Facility.find(params[:id])
  end

  private

  def search_params
    params[:q]&.permit(:name, :description, :address, :prefecture_id, :category_id, :animal_id)
  end
end
