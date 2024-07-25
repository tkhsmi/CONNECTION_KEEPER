class Users::TagsController < ApplicationController
  before_action :set_tag, only: %i[edit update]

  def index
    @tags = Tag.all
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    @tag.user_id = current_user.id

    if @tag.save
      redirect_to users_tags_path
    else
      render :new
    end
  end

  def edit; end

  def update; end

  def destroy; end

  private

  def set_tag
    @tag = Tag.find(params[:id])
  end

  def tag_params
    params.require(:tag).permit(:name)
  end
end
