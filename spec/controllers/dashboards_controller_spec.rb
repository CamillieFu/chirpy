require 'rails_helper'

RSpec.describe DashboardsController, type: :controller do
  login_user

  let!(:kid1) { Kid.new(first_name: 'Bran', last_name: 'Len', birthday: '2022-04-01', user_id: 102) }
  let!(:kid2) { Kid.new(first_name: 'Sad', last_name: 'Sack', birthday: '2022-01-01', user_id: 102) }

  describe '#index' do
    before do
      get :index
    end

    it 'renders index' do
      expect(response).to render_template(:index)
    end

    it 'assigns 2 kids' do
      expect(assigns(:kids).count).to eq(2)
    end
  end
end
