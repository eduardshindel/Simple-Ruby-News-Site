require 'rails_helper'

RSpec.describe 'Sessions', type: :request do
  context 'logins' do
    before do
      User.create(name: 'admin', password: '21232f297a57a5a743894a0e4a801fc3')
    end

    it 'logins successfully' do
      post '/login',
        params: { session: { username: 'admin', password: 'admin' } }

      expect(response.status).to eq(302)
      expect(response).to redirect_to '/articles'
    end

    it 'logins invalid' do
      post '/login',
        params: { session: { username: 'admin', password: 'admon' } }

      expect(response.status).to eq(200)
      expect(request.original_fullpath).to eq('/login')
    end
  end
end
