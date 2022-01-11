require 'rails_helper'

describe 'from category to all articles', type: :feature, driver: :selenium_firefox, js: true do
  before do
    Article.create(title: 'politics_title', body: 'politics_body', preview: 'politics_preview', category: 'politics')
    Article.create(title: 'religion_title', body: 'religion_body', preview: 'religion_preview', category: 'religion')
    Article.create(title: 'also_religion_title', body: 'also_religion_body', preview: 'also_religion_preview',
                   category: 'religion')
  end

  it 'goes from particular category to all articles' do
    visit '/categories/religion'
    select 'All articles', from: 'Category'
    expect(page).to have_current_path('/articles')
  end
end
