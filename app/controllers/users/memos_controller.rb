class Users::MemosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_memo, only: %i[edit update]

  def index
    @memos = current_user.memo
    @memo = current_user.memo.find_by(id: params[:id]) || current_user.memo.first

    @people = current_user.person # TODO @memoに紐づくヒトを表示する
  end

  def show
    @memo = Memo.find(params[:id])
    render json: @memo
  end

  def new
    @memo = Memo.new
  end

  def create
    @memo = Memo.new(memo_params)
    @memo.user_id = current_user.id

    if @memo.save
      if request.referer&.include?('users/people')
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

  def destroy
    memo = Memo.find(params[:id])
    memo.destroy if memo.user_id == current_user.id
    redirect_to users_memos_path
  end

  private

  def set_memo
    @memo = Memo.find(params[:id])
  end

  def memo_params
    params.require(:memo).permit(:content)
  end
end
