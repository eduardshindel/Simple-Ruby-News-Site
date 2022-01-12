require 'rails_helper'

RSpec.describe 'Sessions', type: :request do
  it 'logins successfully' do
    User.create(name: 'admin', password: '21232f297a57a5a743894a0e4a801fc3' )

    post "/login",
      params: { session: { username: "admin", password: "admin" } }

    expect(response.status).to eq(302)
  end
  it 'logins invalid' do
    User.create(name: 'admin', password: '21232f297a57a5a743894a0e4a801fc3' )

    post "/login",
      params: { session: { username: "admin", password: "admon" } }

    expect(response.status).to eq(200)
  end
end
