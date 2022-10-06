# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'api/springs', type: :request do
  path '/springs' do
    get 'Retrieves all springs' do
      tags 'Springs'
      produces 'application/json', 'application/xml'

      response '200', 'spring found' do
        schema type: :array,
               items: {
                 properties: {
                   id: { type: :integer },
                   brand: { type: :string, nullable: true },
                   reference: { type: :string, nullable: true },
                   spires: { type: :integer, nullable: true },
                   linear: { type: :boolean, nullable: true },
                   price: { type: :float, nullable: true }
                 }
               }

        run_test!
      end
    end

    path '/springs/{id}' do
      get 'Retrieves a spring' do
        tags 'Springs'
        produces 'application/json', 'application/xml'
        parameter name: :id, in: :path, type: :string

        response '200', 'spring found' do
          schema type: :object,
                 properties: {
                   id: { type: :integer },
                   brand: { type: :string, nullable: true },
                   reference: { type: :string, nullable: true },
                   spires: { type: :integer, nullable: true },
                   linear: { type: :boolean, nullable: true },
                   price: { type: :float, nullable: true }
                 }

          let(:id) { Spring.create(reference: 'SP90').id }
          run_test!
        end

        response '404', 'spring not found' do
          let(:id) { 'invalid' }
          run_test!
        end
      end
    end

    post 'Creates a spring' do
      tags 'Springs'
      consumes 'application/json'
      parameter name: :spring, in: :body, schema: {
        type: :object,
        properties: {
          brand: { type: :string, nullable: true },
          reference: { type: :string },
          spires: { type: :integer, nullable: true },
          linear: { type: :boolean, nullable: true },
          price: { type: :float, nullable: true }
        },
        required: ['reference']
      }

      response '201', 'spring created' do
        let(:spring) { { reference: 'SP90' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:spring) { { reference: nil } }
        run_test!
      end
    end
  end
end
