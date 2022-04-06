require 'rails_helper'

RSpec.describe KidsController, type: :controller do
  login_user

  describe '#create' do
    before do
      post :create, params: { kid: { first_name: 'Tom', last_name: 'Baby', birthday: '2-2-2022' } }
    end

    it 'creates a kid' do
      expect(Kid.find_by(first_name: 'Tom').last_name).to eq('Baby')
    end

    it 'redirects to dashboards_path' do
      expect(response).to redirect_to(dashboards_path)
    end

    it 'assigns a kid' do
      expect(assigns(:kid).class).to eq(Kid)
    end
  end

  # describe '#show' do
  #   it 'displays a kid' do
  #     get :show
  #     expect(Kid.)
  #   end
  # end
end
