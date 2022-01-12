require 'rails_helper'

RSpec.describe 'Articles', type: :request do
    before do
        Article.create( title: 'politics_title', body: 'politics_body', preview: 'politics_preview', category: 'politics')
        Article.create(title: 'religion_title', body: 'religion_body', preview: 'religion_preview', category: 'religion')
       Article.create(title: 'also_religion_title', body: 'also_religion_body', preview: 'also_religion_preview',
                        category: 'religion')
                        
       end
    it 'creates new article' do
        User.create(id: 1, name: 'admin', password: '21232f297a57a5a743894a0e4a801fc3' )
        #debugger
        
        post '/login', params: {
            data: {
                name: 'admin',
                password: '21232f297a57a5a743894a0e4a801fc3'
            }
          }
          expect(response.status).to eq(201)

    end
end
