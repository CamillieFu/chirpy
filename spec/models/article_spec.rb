require 'rails_helper'

RSpec.describe Article, type: :model do
  let!(:article) { Article.new(title: 'Title', date: '2022-04-04', author: 'Franz Kafka',
                              content: 'Content is present and accounted for') }

  describe '#initialize' do
    context 'when valid' do
      it 'returns a created Article' do
        expect(article.valid?).to eq(true)
      end
    end

    context 'without title' do
      before { article.title = nil }
      it 'returns an invalid article without title' do
        # expect(article.valid?).to eq(false)
        article.valid?
        expect(article.errors.messages).to eq({ title: ["can't be blank"] })
      end
    end

    context 'without author' do
      before { article.author = nil }
      it 'returns an invalid article without author' do
        # expect(article.valid?).to eq(false)
        article.valid?
        expect(article.errors.messages).to eq({ author: ["can't be blank"] })
      end
    end
  end
end
