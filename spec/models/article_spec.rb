require 'rails_helper'

RSpec.describe Article, type: :model do
  it 'creates article with missing title' do
    invalid_article = described_class.create(body: 'regular_body', preview: 'regular_preview',
                                             category: 'regular_category')
    expect(invalid_article).not_to be_valid
  end

  it 'creates regular article' do
    regular_article = described_class.create(title: 'regular_title', body: 'regular_body', preview: 'regular_preview',
                                             category: 'regular_category')
    expect(regular_article.as_json).to include 'title' => 'regular_title', 'body' => 'regular_body',
                                               'preview' => 'regular_preview', 'category' => 'regular_category'
  end
end
