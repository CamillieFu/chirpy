require 'rails_helper'

RSpec.describe Kid, type: :model do
  let!(:user) { User.new(first_name: 'Gill', last_name: 'Beans') }
  let!(:dictionary) { Dictionary.new(words: 'mofo') }
  let!(:kid) { Kid.new(first_name: 'Brand', last_name: 'New', birthday: '2022-04-01',
              user: user, dictionary: dictionary)}

  describe '#initialize' do
    context 'when valid' do
      it 'returns a created Kid' do
        expect(kid.valid?).to eq(true)
      end
    end

    context 'without a first name' do
      before { kid.first_name = nil }
      it 'returns an invalid kid without a first name' do
        kid.valid?
        expect(kid.errors.messages).to eq({ first_name: ["can't be blank"] })
      end
    end

    context 'without a birthday' do
      before { kid.birthday = nil }
      it 'returns an invalid kid without a birthday' do
        kid.valid?
        expect(kid.errors.messages).to eq({ birthday: ["can't be blank"] })
      end
    end

    context 'missing a user' do
      before { kid.user = nil }
      it 'returns a creation error for kid without a user' do
        kid.valid?
        expect(kid.errors.messages).to eq({ user: ["must exist"] })
      end
    end
  end
end
