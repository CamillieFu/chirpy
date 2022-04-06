require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  let!(:article1) { Article.create(title: 'Title', date: '2000-12-25', author: 'Franz Kafka',
                              content: 'Content is present and accounted for') }
  let!(:article2) { Article.create(title: 'Another Title', date: '2001-01-01', author: 'Bill Splatnum',
                              content: 'Why oh why do we need content?') }

  describe 'GET #index' do
    before do
      get :index
    end

    it 'renders index' do
      expect(response).to render_template(:index)
    end

    it 'assigns 2 articles' do
      expect(assigns(:articles).count).to eq(2)
    end
  end

  describe 'GET #show/:id' do
    before do
      get :show(:article1)
    end
  end
end
