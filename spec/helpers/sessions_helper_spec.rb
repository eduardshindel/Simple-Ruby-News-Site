require 'rails_helper'

RSpec.describe SessionsHelper, type: :helper do
  before do
    User.create(name: 'admin', password: '21232f297a57a5a743894a0e4a801fc3')
  end

  let(:user1) { User.find(1) }

  context 'when user logs in' do
    it 'correct log in' do
      log_in(user1)
      expect(session[:user_id]).to eq user1.id
      expect(logged_in?).to be true
    end

    it 'checks correct logged_in' do
      log_in(user1)
      expect(logged_in?).to be true
    end

    it 'checks incorrect logged_in' do
      expect(logged_in?).to be false
    end
  end
end
