require 'rails_helper'

RSpec.describe 'Articles requests', type: :request do
  it 'creates new article' do
    User.create(name: 'admin', password: '21232f297a57a5a743894a0e4a801fc3')

    post '/login', params: { session: { username: 'admin', password: 'admin' } }

    post '/articles',
         params: { article: { title: 'Test title', body: 'test body text', preview: 'test prew', category: 'turtle',
                              img: '' } }
    expect(response.status).to eq(302)
  end

  it 'creates invalid article' do
    User.create(name: 'admin', password: '21232f297a57a5a743894a0e4a801fc3')

    post '/login',
         params: { session: { username: 'admin', password: 'admin' } }

    post '/articles',
         params: { article: { title: 'Test title', body: 'test body text', preview: 'test prew', category: '',
                              img: '' } }
    expect(response.status).to eq(200)
  end

  it 'visit article create without login' do
    post '/articles',
         params: { article: { title: 'Test title', body: 'test body text', preview: 'test prew', category: '',
                              img: '' } }
    expect(response.status).to eq(200)
  end

  it 'creates invalid article' do
    get '/articles/new'
    expect(response.status).to eq(302)
  end

  it 'reaches article list' do
    get '/articles'
    expect(response.status).to eq(200)
  end

  it 'update article' do
    User.create(name: 'admin', password: '21232f297a57a5a743894a0e4a801fc3')

    post '/login',
         params: { session: { username: 'admin', password: 'admin' } }

    post '/articles',
         params: { article: { title: 'Test title', body: 'test body text', preview: 'test prew', category: 'turtle',
                              img: '' } }

    patch '/articles/3',
          params: { article: { title: 'Test title', body: 'test body text', preview: 'test prew', category: 'turtle',
                               img: '' } }

    expect(response.status).to eq(302)
  end

  it 'wrong update article' do
    User.create(name: 'admin', password: '21232f297a57a5a743894a0e4a801fc3')

    post '/login',
         params: { session: { username: 'admin', password: 'admin' } }

    post '/articles',
         params: { article: { title: 'Test title', body: 'test body text', preview: 'test prew', category: 'turtle',
                              img: '' } }

    patch '/articles/4',
          params: { article: { title: 'Test title', body: 'test body text', preview: 'test prew', category: '',
                               img: '' } }

    expect(response.status).to eq(200)
  end

  it 'destroy article' do
    User.create(name: 'admin', password: '21232f297a57a5a743894a0e4a801fc3')

    post '/login',
         params: { session: { username: 'admin', password: 'admin' } }

    post '/articles',
         params: { article: { title: 'Test title', body: 'test body text', preview: 'test prew', category: 'turtle',
                              img: '' } }

    delete '/articles/5'

    expect(response.status).to eq(302)
  end
end
