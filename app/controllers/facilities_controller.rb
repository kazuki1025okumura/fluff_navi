class FacilitiesController < ApplicationController
  skip_before_action :require_login, only: %i[index show]
  def index
    @facility = Facility.all.order(created_at: :desc)
  end

  def show
    @facility = Facility.find(params[:id])
  end
end
