class GalleriesController < ApplicationController
  before_action :require_login, except: [:index, :show]

  def index
    @galleries = Gallery.all
  end

  def new
    @gallery = Gallery.new
  end

  def create
    user = current_user
    gallery_params_with_user = gallery_params.merge(user_id: user.id)
    @gallery = Gallery.new(gallery_params_with_user)
    if @gallery.save
      redirect_to galleries_path
    else
      render :new
    end
  end

  def show
    @gallery = Gallery.find(params[:id])
    @images = @gallery.images
  end

  def destroy
    gallery = Gallery.find(params[:id])
    gallery.destroy
    redirect_to galleries_path
  end

  def edit
    @gallery = Gallery.find(params[:id])
  end

  def update
    @gallery = Gallery.find(params["id"])
    if @gallery.update(gallery_params)
      redirect_to @gallery
    else
      render :edit
    end
  end

  private

  def gallery_params
    params.
      require(:gallery).
      permit(:name, :description)
  end
end
