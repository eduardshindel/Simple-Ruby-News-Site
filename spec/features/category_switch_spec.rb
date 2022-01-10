require 'rails_helper'

describe 'from category to all articles', type: :feature, driver: :selenium_chrome, js: true do
    before :each do
        Article.create(title: 'politics_title', body:'politics_body', preview:'politics_preview', category:'politics')
        Article.create(title: 'religion_title', body:'religion_body', preview:'religion_preview', category:'religion')
        Article.create(title: 'also_religion_title', body:'also_religion_body', preview:'also_religion_preview', category:'religion')
    end
    it 'goes from particular category to all articles' do
        visit '/categories/religion'
        select 'All articles', from: 'Category'
        expect(current_path).to eq('/articles')
    end
end