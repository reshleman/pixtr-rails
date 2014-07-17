class GalleryLikesController < ApplicationController
  before_action :require_login

  def create
    gallery = Gallery.find(params[:gallery_id])
    current_user.like(gallery)

    redirect_to gallery
  end

  def destroy
   gallery = Gallery.find(params[:gallery_id])
   current_user.unlike(gallery)

   redirect_to gallery
  end
end
