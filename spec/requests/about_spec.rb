# frozen_string_literal: true

RSpec.describe 'About', type: :request do
  describe 'GET /index' do
    it 'is successful' do
      get about_index_path

      expect(response).to be_successful
    end
  end
end
