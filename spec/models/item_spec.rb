# frozen_string_literal: true

RSpec.describe Item, type: :model do
  describe '.active' do
    subject(:active) { described_class.active }

    let!(:available) { FactoryBot.create(:item, status: 'available') }
    let!(:reserved) { FactoryBot.create(:item, status: 'reserved') }
    let!(:sold) { FactoryBot.create(:item, status: 'sold') }

    before { FactoryBot.create(:item, status: 'removed') }

    it { is_expected.to match_array([available, reserved, sold]) }
  end
end
