require 'rails_helper'

describe 'switching categories', type: :feature, driver: :selenium_firefox, js: true do
  before do
    Article.create(title: 'politics_title', body: 'politics_body', preview: 'politics_preview', category: 'politics')
    Article.create(title: 'religion_title', body: 'religion_body', preview: 'religion_preview', category: 'religion')
    Article.create(title: 'also_religion_title', body: 'also_religion_body', preview: 'also_religion_preview',
                   category: 'religion')
  end

  it 'goes from particular category to all articles' do
    visit '/categories/religion'
    page.select 'All articles', from: 'Category'
    expect(page).to have_current_path('/articles')
  end

  it 'goes from "All articles" category to a particular category' do
    visit '/articles#index'
    page.select 'religion', from: 'Category'
    expect(page).to have_current_path('/categories/religion')
  end
end
