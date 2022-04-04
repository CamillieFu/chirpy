require 'rails_helper'

RSpec.describe Dictionary, type: :model do
  let!(:dictionary) { Dictionary.new(words: 'banger') }
  let!(:kid) { Kid.new(first_name: 'Basic', last_name: 'Stan', birthday: '2022-04-01')}

  describe '#initialize' do
    context 'can have a kid' do
      before { dictionary.kids << kid }
      it 'returns a created kid belonging to dictionary' do
        expect(dictionary.kids.any?).to eq(true)
      end
    end
  end
end
