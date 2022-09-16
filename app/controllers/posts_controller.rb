class PostsController < ApplicationController
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
    @post = Post.find(params[:id])
    @post.destroy!
    redirect_to facility_path(@post.facility)
  end

  private

  def post_params
    params.require(:post).permit(:title, :image, :image_cache).merge(facility_id: params[:facility_id])
  end
end
