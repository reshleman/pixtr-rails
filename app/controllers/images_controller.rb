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
    @gallery = Gallery.find(params[:gallery_id])
    @image = Image.new(image_params)
    @image.gallery_id = params[:gallery_id]
    if @image.save
      redirect_to @gallery
    else
      render :new
    end
  end

  def edit
    @image = Image.find(params[:id])
    @gallery = @image.gallery
  end

  def update
    @gallery = Gallery.find(params[:gallery_id])
    @image = Image.find(params[:id])
    if @image.update(image_params)
      redirect_to @gallery
    else
      render :edit
    end
  end

  def destroy
    image = Image.find(params[:id])
    gallery = image.gallery
    image.destroy

    redirect_to gallery
  end

  private

  def image_params
    params.require(:image).permit(:name, :url, :description)
  end
end
