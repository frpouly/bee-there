# frozen_string_literal: true

require 'swagger_helper'

describe '/hives' do
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

  path '/hives' do
    post 'Creates a hive' do
      tags 'Hives'
      consumes 'application/json'
      parameter name: :hive, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          weight: { type: :integer }
        },
        required: %w[name weight]
      }
      request_body_example value: { name: 'Splendid hive', weight: 23 }

      response '201', 'hive created' do
        let(:hive) { { name: 'Splendid hive', weight: 8 } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:hive) { { name: 'Hive', weight: 8 } }
        run_test!
      end
    end

    get 'Get all hives' do
      tags 'Hives'
      produces 'application/json'
      response '200', 'OK' do
        schema type: :array,
               items: {
                 type: :object,
                 properties: {
                   id: { type: :integer },
                   name: { type: :string },
                   weight: { type: :integer }
                 },
                 required: %w[id name weight]
               }

        run_test!
      end

      before do
        2.times do
          Hive.create(
            {
              name: Faker::Lorem.characters(number: 8),
              weight: Faker::Number.number(digits: 2)
            }
          )
        end
      end
    end
  end

  path '/hives/{id}' do
    get 'Retrives a hive' do
      tags 'Hives'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string

      response '200', 'hive found' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 name: { type: :string },
                 weight: { type: :integer },
                 created_at: { type: :datetime },
                 updated_at: { type: :datetime }
               },
               required: %w[id name weight created_at updated_at]

        let(:id) { Hive.create(name: 'Splendid hive', weight: 1).id }
        run_test!
      end

      response '404', 'blog not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end

    delete 'Deletes the hive' do
      tags 'Hives'
      parameter name: :id, in: :path, type: :string

      response '204', 'deleted' do
        let(:id) { Hive.create(name: 'Splendid hive', weight: 1).id }
        run_test!
      end
    end
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
        post hives_url, params: { hive: valid_attributes }, as: :json
        expect(response).to have_http_status(:created)
      end

      it 'has the correct content type' do
        post hives_url, params: { hive: valid_attributes }, as: :json
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
        post hives_url, params: { hive: invalid_attributes }, as: :json
        expect(response.content_type).to match(a_string_including('application/json'))
      end

      it 'has the correct HTTP code' do
        post hives_url, params: { hive: invalid_attributes }, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
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
