class GroupMembershipsController < ApplicationController
  def create
    group = Group.find(params[:id])
    current_user.join(group)

    flash[:success] = "You've joined this group. Welcome!"
    redirect_to group 
  end

  def destroy
    group = Group.find(params[:id])
    current_user.leave(group)

    flash[:success] = "You've left the group. Bye!"
    redirect_to group
  end
end
