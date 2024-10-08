class Users::PeopleController < ApplicationController
  before_action :authenticate_user!
  before_action :set_person, only: %i[show edit update]

  def index
    @people = current_user.person.order(:furigana)
    @person = current_user.person.find_by(id: params[:id]) || current_user.person.order(:furigana).first

    @memos = current_user.memo # TODO: @personに紐づくメモを表示する
  end

  def show
    @person = Person.find(params[:id])
    render json: @person
  end

  def create
    @person = Person.new(person_params)
    @person.user_id = current_user.id

    if @person.save
      # redirect_to users_people_path
    else
      @person # TODO フォームにエラーを表示するようにする
    end
    redirect_to users_people_path
  end

  def edit; end

  def update; end

  def destroy
    person = Person.find(params[:id])
    person.destroy if person.user_id == current_user.id
    redirect_to users_people_path, status: :see_other
  end

  private

  def set_person
    @tag = Person.find(params[:id])
  end

  def person_params
    params.require(:person).permit(:furigana, :name, :birthday, :phone_number, :mail, :address)
  end
end
