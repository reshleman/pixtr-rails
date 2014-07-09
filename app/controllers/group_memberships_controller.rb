class GroupMembershipsController < ApplicationController
  def create
    group = Group.find(params[:group_id])
    group.users << current_user
    group.save

    redirect_to group
  end
end
