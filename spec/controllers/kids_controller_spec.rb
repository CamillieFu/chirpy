require 'rails_helper'

RSpec.describe KidsController, type: :controller do
  describe '#create' do
    it 'creates a kid' do
      post :create, params: { kid: { first_name: 'Tom', last_name: 'Baby', birthday: '2-2-2022' } }
      expect(Kid.find_by(first_name: 'Tom').last_name).to eq('Baby')
    end
  end
end
