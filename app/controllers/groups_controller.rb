class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    group_membership = GroupMembership.new(group_membership_params(@group))

    if @group.save
      group_membership.save
      redirect_to groups_path
    else
      render :new
    end
  end

  private

  def group_params
    params.
      require(:group).
      permit(:name, :description)
  end

  def group_membership_params(group)
    { user: current_user, group: group }
  end
end
