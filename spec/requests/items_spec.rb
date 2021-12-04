# frozen_string_literal: true

RSpec.describe 'Items', type: :request do
  describe 'GET /index' do
    it 'is successful' do
      get items_path

      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    let(:item) { FactoryBot.create(:item) }

    it 'is successful' do
      get item_path(item)

      expect(response).to be_successful
    end
  end
end
