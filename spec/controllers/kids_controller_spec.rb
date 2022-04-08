require 'rails_helper'

RSpec.describe KidsController, type: :controller do
  login_user
  let!(:dictionary) { create(:dictionary) }
  let!(:kid) { create(:kid) }

  describe 'POST kids#create' do
    context "when valid" do
      before do
        post :create, params: { kid: { first_name: 'Tom', last_name: 'Baby', birthday: '2-2-2022' } }
      end

      it 'creates a Kid' do
        expect(Kid.find_by(first_name: 'Tom').last_name).to eq('Baby')
      end

      it 'redirects to dashboards_path' do
        expect(response).to redirect_to(dashboards_path)
      end

      it 'assigns a kid' do
        expect(assigns(:kid).class).to eq(Kid)
      end
    end

    context "when invalid" do
      before do
        post :create, params: { kid: { first_name: 'Tom', birthday: '2-2-2022' } }
      end

      it "will render new template" do
        expect(response).to render_template("kids/_new")
      end
    end
  end

  describe 'GET kids#show' do
    before do
      get :show, params: { id: kid.id }
    end

    it 'renders show' do
      expect(response).to render_template(:show)
    end

    it 'assigns a kid' do
      expect(assigns(:kid)).to eq(Kid.first)
    end
  end

  describe 'PATCH kids#update' do
    context "when succesfull" do
      it 'redirects to kid_path' do
        patch :update, params: { id: kid.id, kid: { first_name: 'Timothy' } }
        expect(response).to redirect_to(kid_path(kid.id))
      end
    end

    context "when unsuccessful" do
      before do
        patch :update, params: { id: kid.id, kid: { first_name: '' } }
      end

      it 'redirects to root_path' do
        expect(response).to redirect_to(root_path)
      end

      it 'will set a flash alert' do
        expect(flash[:alert]).to be_present
      end
    end
  end

  describe 'DELETE kids#destroy' do
    before do
      delete :destroy, params: { id: kid.id }
    end

    it 'deletes a kid' do
      expect(Kid.find_by(id: kid.id)).to eq(nil)
    end

    it 'redirects to dashboards_path' do
      expect(response).to redirect_to(dashboards_path)
    end

    it 'will set a flash alert' do
      expect(flash[:remove]).to be_present
    end
  end
end
