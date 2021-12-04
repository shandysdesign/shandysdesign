# frozen_string_literal: true

RSpec.describe 'Contact', type: :request do
  describe 'GET /index' do
    it 'is successful' do
      get contact_index_path

      expect(response).to be_successful
    end
  end
end
