require 'rails_helper'

RSpec.describe 'Articles requests', type: :request do

    it 'creates new article' do
        User.create(name: 'admin', password: '21232f297a57a5a743894a0e4a801fc3' )

        post "/login",
            params: { session: { username: "admin", password: "admin" } }
        
        post "/articles",
            params: { article: { title: "Test title", body: "test body text", preview: "test prew", category: "turtle", img: "" }}
        expect(response.status).to eq(302)
    end

  it 'reaches article list' do
    get '/articles'
    expect(response.status).to eq(200)
  end
end
