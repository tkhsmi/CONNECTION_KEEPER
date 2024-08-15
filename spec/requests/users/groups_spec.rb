require 'rails_helper'

RSpec.describe 'Users::Groups', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/users/groups'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /new' do
    it 'returns http success' do
      get '/users/groups/new'
      expect(response).to have_http_status(:success)
    end
  end
end
