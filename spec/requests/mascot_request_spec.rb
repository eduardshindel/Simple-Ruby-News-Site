require 'rails_helper'

RSpec.describe 'Mascots', type: :request do
  context 'when visiting our mascot page' do
    it 'visits mascots page' do
      get '/mascot'
      expect(response.status).to eq(200)
    end

    it 'visits mascots page in a wrong way' do
      expect { get '/mascot/totally_wrong_url' }.to raise_error(ActionController::RoutingError)
    end
  end
end
