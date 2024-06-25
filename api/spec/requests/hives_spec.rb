# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/hives' do
  let(:valid_attributes) do
    {
      name: Faker::Lorem.characters(number: 8),
      weight: Faker::Number.number(digits: 2)
    }
  end

  let(:invalid_attributes) do
    {
      name: Faker::Lorem.characters(number: 4),
      weight: Faker::Number.number(digits: 2)
    }
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Hive.create! valid_attributes
      get hives_url, as: :json
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      hive = Hive.create! valid_attributes
      get hive_url(hive), as: :json
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Hive' do
        expect do
          post hives_url,
               params: { hive: valid_attributes }, as: :json
        end.to change(Hive, :count).by(1)
      end

      it 'renders a JSON response with the new hive' do
        post hives_url,
             params: { hive: valid_attributes }, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Hive' do
        expect do
          post hives_url,
               params: { hive: invalid_attributes }, as: :json
        end.not_to change(Hive, :count)
      end

      it 'renders a JSON response with errors for the new hive' do
        post hives_url,
             params: { hive: invalid_attributes }, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested hive' do
      hive = Hive.create! valid_attributes
      expect do
        delete hive_url(hive), as: :json
      end.to change(Hive, :count).by(-1)
    end
  end
end
