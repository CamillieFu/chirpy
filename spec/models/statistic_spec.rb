require 'rails_helper'

RSpec.describe Statistic, type: :model do
  let!(:kid) { Kid.new(first_name: 'Basic', last_name: 'Stan', birthday: '2022-04-01')}
  let!(:statistic) { Statistic.new(kid: kid, tone: :joy) }

  describe '#initialize' do
    context 'when valid' do
      it 'returns a created Statistic' do
        expect(statistic.valid?).to eq(true)
      end
    end

    context 'missing a kid' do
      before { statistic.kid = nil }
      it 'returns a creation error for statistic without a kid' do
        statistic.valid?
        expect(statistic.errors.messages).to eq({ kid: ["must exist"] })
      end
    end

    # context 'incorrect tone not included in enum' do
    #   before { statistic.tone = :pizza }
    #   it 'returns an invalid statistic' do
    #     expect(statistic.tone.errors.messages).to eq("'pizza' is not a valid tone")
    #   end
    # end
  end
end
