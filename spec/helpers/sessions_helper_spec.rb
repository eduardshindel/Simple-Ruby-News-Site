require 'rails_helper'

RSpec.describe SessionsHelper, type: :helper do
  context 'User log in' do
    before do
      @user1 = User.create(name: 'admin', password: '21232f297a57a5a743894a0e4a801fc3')
    end

    it 'correct log in' do
      log_in(@user1)
      expect(session[:user_id]).to eq @user1.id
      expect(logged_in?).to be true
    end

    it 'checks correct logged_in' do
      log_in(@user1)
      expect(logged_in?).to be true
    end

    it 'checks incorrect logged_in' do
      expect(logged_in?).to be false
    end
  end
end