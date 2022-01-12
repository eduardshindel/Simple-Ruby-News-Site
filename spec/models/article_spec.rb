require 'rails_helper'

RSpec.describe Article, type: :model do
  it 'creates article with missing title' do
    invalid_article = Article.create( body: 'regular_body', preview: 'regular_preview', category: 'regular_category')
    expect(invalid_article).to_not be_valid
  end
  it 'creates regular article' do
    regular_article = Article.create( title: 'regular_title', body: 'regular_body', preview: 'regular_preview', category: 'regular_category')
    expect(regular_article.title).to eq 'regular_title'
    expect(regular_article.body).to eq 'regular_body'
    expect(regular_article.preview).to eq 'regular_preview'
    expect(regular_article.title).to eq 'regular_title'
  end
end
