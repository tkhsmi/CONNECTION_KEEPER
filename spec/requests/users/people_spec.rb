require 'rails_helper'

RSpec.describe 'Users::People', type: :request do
  describe 'GET /index' do
    xit 'returns http success' do
      get '/users/people'
      expect(response).to have_http_status(:success)
    end
  end
end
