class Users::PeopleController < ApplicationController
  before_action :set_person, only: %i[show edit update]

  def index
    @people = current_user.person
    @person = current_user.person.find_by(id: params[:id]) || current_user.person.first

    @memos = current_user.memo # TODO: @personに紐づくメモを表示する
  end

  def show
    @person = Person.find(params[:id])
    render json: @person
  end

  def new
    @person = Person.new
  end

  def create
    @person = Person.new(person_params)
    @person.user_id = current_user.id

    if @person.save
      redirect_to users_people_path
    else
      render :new
    end
  end

  def edit; end

  def update; end

  def destroy; end

  private

  def set_person
    @tag = Person.find(params[:id])
  end

  def person_params
    params.require(:person).permit(:name, :birthday)
  end
end
