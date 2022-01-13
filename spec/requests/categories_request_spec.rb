require 'rails_helper'

RSpec.describe 'Categories', type: :request do
  context 'when going to category' do
    before do
      Article.create(title: 'also_religion_title', body: 'also_religion_body', preview: 'also_religion_preview',
                     category: 'religion')
      Article.create(title: 'also_religion_title', body: 'also_religion_body', preview: 'also_religion_preview',
                     category: 'another_religion')
    end

    it 'goes to existing category' do
      get '/categories/another_religion'
      expect(response.status).to eq(200)
    end

    it 'goes to unexisting category' do
      get '/categories/relig1on'
      expect(response.status).to eq(404)
    end
  end
end
