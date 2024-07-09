require 'rails_helper'

RSpec.describe User, type: :system do
  let(:user) { create(:user) }

  it 'login' do
    login_user(user)
  end
end
