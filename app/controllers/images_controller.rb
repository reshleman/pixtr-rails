class ImagesController < ApplicationController
  def show
    @image = Image.find(params[:id])
    @gallery = @image.gallery
  end

  def new
    @gallery = Gallery.find(params[:gallery_id])
    @image = Image.new
  end

  def create
    image = Image.new(image_params)
    image.gallery_id = params[:gallery_id]
    image.save

    redirect_to gallery_path(image.gallery_id)
  end

  def edit
    @image = Image.find(params[:id])
    @gallery = @image.gallery
  end

  def update
    image = Image.find(params[:id])
    image.update(image_params)

    redirect_to gallery_path(image.gallery_id)
  end

  def destroy
    image = Image.find(params[:id])
    gallery = image.gallery
    image.destroy

    redirect_to gallery_path(gallery.id)
  end

  private

  def image_params
    params.require(:image).permit(:name, :url, :description)
  end
end
