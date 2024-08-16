class Users::MemosController < ApplicationController
  before_action :set_memo, only: %i[show edit update]

  def index
    @memos = current_user.memo
  end

  def show; end

  def new
    @memo = Memo.new
  end

  def create
    @memo = Memo.new(memo_params)
    @memo.user_id = current_user.id

    if @memo.save
      if request.referer&.include?("users/people")
        redirect_to users_people_path
      else
        redirect_to users_memos_path
      end
    else
      render :new
    end
  end

  def edit; end

  def update; end

  def destroy; end

  private

  def set_memo
    @tag = memo.find(params[:id])
  end

  def memo_params
    params.require(:memo).permit(:content)
  end
end
