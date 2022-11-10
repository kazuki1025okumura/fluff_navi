class HomeController < ApplicationController
  skip_before_action :require_login, only: %i[index]

  def index
    @posts = Post.all.includes(%i[facility]).sample(12)
    @facilities = Facility.where(suggest: 1).includes(%i[facility_categories categories managements animals posts]).sample(3)
  end
end
