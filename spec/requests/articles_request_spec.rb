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
      expect(response).to redirect_to '/articles/1'
    end

    it 'creates invalid article' do
      post '/articles',
           params: { article: { title: 'Test title', body: 'test body text', preview: 'test prew', category: '',
                                img: '' } }
      expect(request.original_fullpath).to eq('/articles')
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
      expect(request.original_fullpath).to eq('/articles/new')
    end

    it 'go to article list' do
      get '/articles'
      expect(request.original_fullpath).to eq('/articles')
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

    it 'updates article and article exists' do
      patch '/articles/1',
            params: { article: { title: 'Test title', body: 'test body text', preview: 'test prew',
                                 category: 'turtle', img: '' } }

      expect(request.original_fullpath).to eq('/articles/1')
    end

    it 'updates article and gets correct response' do
      patch '/articles/1',
            params: { article: { title: 'Test title', body: 'test body text', preview: 'test prew',
                                 category: 'turtle', img: '' } }

      expect(response.status).to eq(302)
    end

    it 'wrong update article' do
      patch '/articles/1',
            params: { article: { title: 'Test title', body: 'test body text', preview: 'test prew', category: '',
                                 img: '' } }

      expect(request.original_fullpath).to eq('/articles/1')
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
    it 'visiting should be failed' do
      post '/articles',
           params: { article: { title: 'Test title', body: 'test body text', preview: 'test prew',
                                category: '', img: '' } }
      expect(request.original_fullpath).to eq('/articles')
    end
  end

  context 'when visiting articles' do
    before do
      Article.create(title: 'politics_title', body: 'politics_body', preview: 'politics_preview', category: 'politics')\
    end

    it 'visits existing page' do
      get '/articles/1'
      expect(request.original_fullpath).to eq('/articles/1')
    end

    it 'visits unexisting page' do
      expect { get '/articles/5' }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
