class HomesController < ApplicationController
  def show
    if signed_in?
      redirect_to current_user
    else
      @user = User.new
    end
  end
end
