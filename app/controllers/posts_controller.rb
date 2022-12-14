class PostsController < ApplicationController
  before_action :add_noindex_tag_to_response_headers, only: %i[new]

  def new
    @facility = Facility.find(params[:facility_id])
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to facility_path(@post.facility), success: t('.success')
    else
      @facility = Facility.find(params[:facility_id])
      flash.now[:error] = t('.error')
      render :new
    end
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy!
    flash.now[:success] = t('.success')
  end

  private

  def post_params
    params.require(:post).permit(:title, :image, :image_cache).merge(facility_id: params[:facility_id])
  end
end
