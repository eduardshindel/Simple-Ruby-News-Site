require 'rails_helper'

RSpec.describe 'Articles requests', type: :request do

    context 'creating articles' do
        before(:all) do
            User.create(name: 'admin', password: '21232f297a57a5a743894a0e4a801fc3' )
    
            post "/login",
                params: { session: { username: "admin", password: "admin" } }
        end

        it 'creates new article' do
            post "/articles",
                params: { article: { title: "Test title", body: "test body text", preview: "test prew", category: "turtle", img: "" }}
            expect(response.status).to eq(302)
        end

        it 'creates invalid article' do        
            post "/articles",
                params: { article: { title: "Test title", body: "test body text", preview: "test prew", category: "", img: "" }}
            expect(response.status).to eq(200)
        end
    end

    context 'go to' do
        before(:all) do
            User.create(name: 'admin', password: '21232f297a57a5a743894a0e4a801fc3' )
    
            post "/login",
                params: { session: { username: "admin", password: "admin" } }
        end

        it 'go to articles/new' do
            get "/articles/new"
            expect(response.status).to eq(200)
        end

        it 'go to article list' do
        get '/articles'
        expect(response.status).to eq(200)
        end
    end

    context 'updating and demolition' do
        before(:all) do
            User.create(name: 'admin', password: '21232f297a57a5a743894a0e4a801fc3' )
    
            post "/login",
                params: { session: { username: "admin", password: "admin" } }
        end

        it 'update article' do    
            post "/articles",
                params: { article: { title: "Test title", body: "test body text", preview: "test prew", category: "turtle", img: "" }}

            patch "/articles/3",
                params: { article: { title: "Test title", body: "test body text", preview: "test prew", category: "turtle", img: "" }}

            expect(response.status).to eq(302)
        end

        it 'wrong update article' do
            post "/articles",
                params: { article: { title: "Test title", body: "test body text", preview: "test prew", category: "turtle", img: "" }}

            patch "/articles/4",
                params: { article: { title: "Test title", body: "test body text", preview: "test prew", category: "", img: "" }}

            expect(response.status).to eq(200)
        end
    
        it 'destroy article' do
            post "/articles",
                params: { article: { title: "Test title", body: "test body text", preview: "test prew", category: "turtle", img: "" }}

            delete "/articles/5"
            expect(response.status).to eq(302)
        end
    end

    context 'go to without login' do
        describe 'visit articles/new without login' do
            it 'visiting should be failed' do        
                post "/articles",
                    params: { article: { title: "Test title", body: "test body text", preview: "test prew", category: "", img: "" }}
                expect(response.status).to eq(200)
            end
        end
    end
end
