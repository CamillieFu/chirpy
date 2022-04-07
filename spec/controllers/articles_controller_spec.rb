require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  describe 'GET articles#index' do
    before do
      get :index
      create_list(:article, 2)
    end

    it 'renders index' do
      expect(response).to render_template(:index)
    end

    it 'assigns 2 articles' do
      expect(assigns(:articles).count).to eq(2)
    end
  end

  describe 'GET articles#show' do
    before do
      article = create(:article)
      visit article_path(article.id)
    end

    it 'renders an article' do
      expect(response).to render_template(:show)
    end
  end
end
