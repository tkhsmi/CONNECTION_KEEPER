require 'rails_helper'

RSpec.describe 'Users::People', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/users/people/index'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /new' do
    it 'returns http success' do
      get '/users/people/new'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /edit' do
    it 'returns http success' do
      get '/users/people/edit'
      expect(response).to have_http_status(:success)
    end
  end
end
