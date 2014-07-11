class CommentsController < ApplicationController
  before_action :require_login

  def create
    gallery = Gallery.find(params[:gallery_id])
    image = gallery.images.find(params[:image_id])
    image.comments.create(comment_params)

    redirect_to [gallery, image]
  end

  private

  def comment_params
    params.
      require(:comment).
      permit(:content).
      merge(user: current_user)
  end
end
