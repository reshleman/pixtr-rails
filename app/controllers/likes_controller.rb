class LikesController < ApplicationController
  before_action :require_login

  def create
    image = Image.find(params[:image_id])
    current_user.like(image)

    redirect_to [image.gallery, image]
  end

  def destroy
   image = Image.find(params[:image_id])
   current_user.unlike(image)

   redirect_to [image.gallery, image]
  end
end
