require 'rails_helper'

RSpec.describe 'Users::People', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      skip '後程ログインできるようにする'
      get '/users/people'
      expect(response).to have_http_status(:success)
    end
  end
end
