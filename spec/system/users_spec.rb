require 'rails_helper'

RSpec.describe User, type: :system do
  let(:user) { create(:user) }

  # 説明
  it 'login' do
    login_user(user)
  end
end
