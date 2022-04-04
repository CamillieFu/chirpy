require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) { User.new(first_name: 'Himiko', last_name: 'Suzuki', email: 'fugupaawaa@gmail.com',
                password: 'thirtyFivecents')}
  let!(:dictionary) { Dictionary.new(words: ['garbage']) }
  let!(:kid) { Kid.new(first_name: 'Basic', last_name: 'Stan', birthday: '2022-04-01')}

  describe '#initialize' do
    context 'when valid' do
      it 'returns a created User' do
        expect(user.valid?).to eq(true)
      end
    end

    context 'can have a kid' do
      before { user.kids << kid }
      it 'returns a created kid belonging to user' do
        expect(user.kids.any?).to eq(true)
      end
    end

    context 'can have a dictionary' do
      before { user.dictionaries << dictionary }
      it 'returns a created dictionary belonging to user' do
        expect(user.dictionaries.any?).to eq(true)
      end
    end

    context 'without a last name' do
      before { user.last_name = nil }
      it 'returns an invalid user without a last name' do
        user.valid?
        expect(user.errors.messages).to eq({ last_name: ["can't be blank"] })
      end
    end

    context 'without a password' do
      before { user.password = nil }
      it 'returns an invalid user without a password' do
        user.valid?
        expect(user.errors.messages).to eq({ password: ["can't be blank"] })
      end
    end
  end
end
