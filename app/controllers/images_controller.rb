class ImagesController < ApplicationController
  before_action :require_login, except: [:show]

  def show
    @gallery = find_gallery
    @image = find_image_in(@gallery)
    @comment = Comment.new
  end

  def new
    @gallery = find_gallery
    @image = Image.new
  end

  def create
    @gallery = find_gallery
    @image = @gallery.images.new(image_params)

    if @image.save
      redirect_to @gallery
    else
      render :new
    end
  end

  def edit
    @gallery = find_gallery
    @image = find_image_in(@gallery)
  end

  def update
    @gallery = find_gallery
    @image = find_image_in(@gallery)

    if @image.update(image_params)
      redirect_to [@gallery, @image]
    else
      render :edit
    end
  end

  def destroy
    gallery = find_gallery
    image = find_image_in(gallery)
    image.destroy

    redirect_to gallery
  end

  private

  def image_params
    params.
      require(:image).
      permit(:name, :url, :description, :tag_list, group_ids: [])
  end

  def find_gallery
    Gallery.find(params[:gallery_id])
  end

  def find_image_in(gallery)
    gallery.images.find(params[:id])
  end
end
