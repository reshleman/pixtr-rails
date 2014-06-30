class GalleriesController < ApplicationController
  def index
    @galleries = Gallery.all
  end

  def new
    @gallery = Gallery.new
  end

  def create
    Gallery.create(gallery_params)
    redirect_to "/galleries"
  end

  def show
    @gallery = Gallery.find(params[:id])
  end

  private

  def gallery_params
    params.
      require(:gallery).
      permit(:name, :description)
  end
end
