class GroupMembershipsController < ApplicationController
  def create
    group = Group.find(params[:id])
    current_user.join(group)

    redirect_to group, alert: "You've joined this group. Welcome!"
  end

  def destroy
    group = Group.find(params[:id])
    current_user.leave(group)

    redirect_to group, alert: "You've left the group. Bye!"
  end
end
