require 'rails_helper'

RSpec.describe 'Articles requests', type: :request do
  context 'when creating articles' do
    before do
      User.create(name: 'admin', password: '21232f297a57a5a743894a0e4a801fc3')

      post '/login',
           params: { session: { username: 'admin', password: 'admin' } }
    end

    it 'creates new article' do
      post '/articles',
           params: { article: { title: 'Test title', body: 'test body text', preview: 'test prew',
                                category: 'turtle', img: '' } }
      expect(response.status).to eq(302)
    end

    it 'creates invalid article' do
      post '/articles',
           params: { article: { title: 'Test title', body: 'test body text', preview: 'test prew', category: '',
                                img: '' } }
      expect(response.status).to eq(200)
    end
  end

  context 'when going to' do
    before do
      User.create(name: 'admin', password: '21232f297a57a5a743894a0e4a801fc3')

      post '/login',
           params: { session: { username: 'admin', password: 'admin' } }
    end

    it 'go to articles/new' do
      get '/articles/new'
      expect(response.status).to eq(200)
    end

    it 'go to article list' do
      get '/articles'
      expect(response.status).to eq(200)
    end
  end

  context 'when updating and demolition' do
    before do
      User.create(name: 'admin', password: '21232f297a57a5a743894a0e4a801fc3')

      post '/login',
           params: { session: { username: 'admin', password: 'admin' } }

      post '/articles',
           params: { article: { title: 'Test title', body: 'test body text', preview: 'test prew',
                                category: 'turtle', img: '' } }
    end

    it 'update article' do
      patch '/articles/1',
            params: { article: { title: 'Test title', body: 'test body text', preview: 'test prew',
                                 category: 'turtle', img: '' } }

      expect(response.status).to eq(302)
    end

    it 'wrong update article' do
      patch '/articles/1',
            params: { article: { title: 'Test title', body: 'test body text', preview: 'test prew', category: '',
                                 img: '' } }

      expect(response.status).to eq(200)
    end

    it 'destroy article' do
      post '/articles',
           params: { article: { title: 'Test title', body: 'test body text', preview: 'test prew',
                                category: 'turtle', img: '' } }

      delete '/articles/1'
      expect(response.status).to eq(302)
    end
  end

  context 'when going to without login' do
    describe 'visit articles/new without login' do
      it 'visiting should be failed' do
        post '/articles',
             params: { article: { title: 'Test title', body: 'test body text', preview: 'test prew',
                                  category: '', img: '' } }
        expect(response.status).to eq(200)
      end
    end
  end
end
