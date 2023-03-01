require 'rails_helper'

RSpec.describe DashboardsController, type: :controller do
  login_user

  describe 'GET dashboards#index' do
    before do
      get :index
      create(:dictionary)
      create_list(:kid, 2)
    end

    it 'renders index' do
      expect(response).to render_template(:index)
    end

    it 'assigns 2 kids' do
      expect(assigns(:kids).count).to eq(2)
    end
  end
end
