require 'rails_helper'

RSpec.describe 'Users::Tags', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/users/tags'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /new' do
    it 'returns http success' do
      get '/users/tags/new'
      expect(response).to have_http_status(:success)
    end
  end
end
