class Users::DashboardController < ApplicationController
  def index
    @memos = current_user.memo
    @people = current_user.person
  end
end
