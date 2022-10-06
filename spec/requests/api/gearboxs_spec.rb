# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'api/gearboxes', type: :request do
  path '/gearboxes' do
    get 'Retrieves all gearboxes' do
      tags 'Gearboxes'
      produces 'application/json', 'application/xml'

      response '200', 'gearbox found' do
        schema type: :array,
               items: {
                 properties: {
                   id: { type: :integer },
                   brand: { type: :string, nullable: true },
                   reference: { type: :string, nullable: true },
                   version: { type: :string, nullable: true },
                   quick_detach: { type: :boolean, nullable: true },
                   blowback: { type: :boolean, nullable: true },
                   reinfored: { type: :boolean, nullable: true },
                   price: { type: :float, nullable: true }
                 }
               }

        run_test!
      end
    end

    path '/gearboxes/{id}' do
      get 'Retrieves a gearbox' do
        tags 'Gearboxes'
        produces 'application/json', 'application/xml'
        parameter name: :id, in: :path, type: :string

        response '200', 'gearbox found' do
          schema type: :object,
                 properties: {
                   id: { type: :integer },
                   brand: { type: :string, nullable: true },
                   reference: { type: :string, nullable: true },
                   version: { type: :string, nullable: true },
                   quick_detach: { type: :boolean, nullable: true },
                   blowback: { type: :boolean, nullable: true },
                   reinfored: { type: :boolean, nullable: true },
                   price: { type: :float, nullable: true }
                 }

          let(:id) { Gearbox.create(reference: 'MAXX').id }
          run_test!
        end

        response '404', 'gearbox not found' do
          let(:id) { 'invalid' }
          run_test!
        end
      end
    end

    post 'Creates a gearbox' do
      tags 'Gearboxes'
      consumes 'application/json'
      parameter name: :gearbox, in: :body, schema: {
        type: :object,
        properties: {
          brand: { type: :string, nullable: true },
          reference: { type: :string, nullable: true },
          version: { type: :string, nullable: true },
          quick_detach: { type: :boolean, nullable: true },
          blowback: { type: :boolean, nullable: true },
          reinfored: { type: :boolean, nullable: true },
          price: { type: :float, nullable: true }
        },
        required: ['reference']
      }

      response '201', 'gearbox created' do
        let(:gearbox) { { reference: 'maxx' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:gearbox) { { reference: nil } }
        run_test!
      end
    end
  end
end
