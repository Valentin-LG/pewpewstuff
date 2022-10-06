# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'api/hop_up_units', type: :request do
  path '/hop_up_units' do
    get 'Retrieves all hop up units' do
      tags 'Hop up units'
      produces 'application/json', 'application/xml'

      response '200', 'hop up unit found' do
        schema type: :array,
               items: {
                 properties: {
                   id: { type: :integer },
                   brand: { type: :string, nullable: true },
                   reference: { type: :string, nullable: true },
                   material: { type: :integer, nullable: true },
                   for_replica: { type: :string, nullable: true },
                   weight: { type: :float, nullable: true },
                   price: { type: :float, nullable: true }
                 }
               }

        run_test!
      end
    end

    path '/hop_up_units/{id}' do
      get 'Retrieves a hop up unit' do
        tags 'Hop up units'
        produces 'application/json', 'application/xml'
        parameter name: :id, in: :path, type: :string

        response '200', 'hop up unit found' do
          schema type: :object,
                 properties: {
                   id: { type: :integer },
                   brand: { type: :string, nullable: true },
                   reference: { type: :string, nullable: true },
                   material: { type: :integer, nullable: true },
                   for_replica: { type: :string, nullable: true },
                   weight: { type: :float, nullable: true },
                   price: { type: :float, nullable: true }
                 }

          let(:id) { HopUpUnit.create(reference: 'default').id }
          run_test!
        end

        response '404', 'hop up unit not found' do
          let(:id) { 'invalid' }
          run_test!
        end
      end
    end

    post 'Creates a hop up unit' do
      tags 'Hop up units'
      consumes 'application/json'
      parameter name: :hop_up_unit, in: :body, schema: {
        type: :object,
        properties: {
          brand: { type: :string, nullable: true },
          reference: { type: :string, nullable: true },
          material: { type: :integer, nullable: true },
          for_replica: { type: :string, nullable: true },
          weight: { type: :float, nullable: true },
          price: { type: :float, nullable: true }
        },
        required: ['reference']
      }

      response '201', 'hop up unit created' do
        let(:hop_up_unit) { { reference: 'SL8' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:hop_up_unit) { { reference: nil } }
        run_test!
      end
    end
  end
end
