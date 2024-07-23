require 'rails_helper'

RSpec.describe 'Users::Tags', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/users/tags/index'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get '/users/tags/show'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /new' do
    it 'returns http success' do
      get '/users/tags/new'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /create' do
    it 'returns http success' do
      post '/users/tags/create'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /edit' do
    it 'returns http success' do
      get '/users/tags/edit'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /update' do
    it 'returns http success' do
      post '/users/tags/update'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'DELETE /destroy' do
    it 'returns http success' do
      delete '/users/tags/destroy'
      expect(response).to have_http_status(:success)
    end
  end
end
