require 'rails_helper'

RSpec.describe 'Users::Memos', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      skip '後程ログインできるようにする'
      get '/users/memos'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /new' do
    it 'returns http success' do
      get '/users/memos/new'
      expect(response).to have_http_status(:success)
    end
  end
end
