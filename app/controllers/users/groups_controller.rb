class Users::GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_group, only: %i[edit update]

  def index
    @groups = Group.all
  end

  def show; end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.user_id = current_user.id

    if @group.save
      redirect_to users_groups_path
    else
      render :new
    end
  end

  def edit; end

  def update; end

  def destroy; end

  private

  def set_group
    @tag = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:name)
  end
end
