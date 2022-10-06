# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'api/nozzles', type: :request do
  path '/nozzles' do
    get 'Retrieves all nozzles' do
      tags 'Nozzles'
      produces 'application/json', 'application/xml'

      response '200', 'nozzle found' do
        schema type: :array,
               items: {
                 properties: {
                   id: { type: :integer },
                   brand: { type: :string, nullable: true },
                   reference: { type: :string, nullable: true },
                   material: { type: :integer, nullable: true },
                   o_ring: { type: :integer, nullable: true },
                   for_replica: { type: :string, nullable: true },
                   weight: { type: :float, nullable: true },
                   length: { type: :float, nullable: true },
                   pric: { type: :float, nullable: true }
                 }
               }

        run_test!
      end
    end

    path '/nozzles/{id}' do
      get 'Retrieves a nozzle' do
        tags 'Nozzles'
        produces 'application/json', 'application/xml'
        parameter name: :id, in: :path, type: :string

        response '200', 'nozzle found' do
          schema type: :object,
                 properties: {
                   id: { type: :integer },
                   brand: { type: :string, nullable: true },
                   reference: { type: :string, nullable: true },
                   material: { type: :integer, nullable: true },
                   o_ring: { type: :integer, nullable: true },
                   for_replica: { type: :string, nullable: true },
                   weight: { type: :float, nullable: true },
                   length: { type: :float, nullable: true },
                   pric: { type: :float, nullable: true }
                 }

          let(:id) { Nozzle.create(reference: 'shs').id }
          run_test!
        end

        response '404', 'nozzle not found' do
          let(:id) { 'invalid' }
          run_test!
        end
      end
    end

    post 'Creates a nozzle' do
      tags 'Nozzles'
      consumes 'application/json'
      parameter name: :nozzle, in: :body, schema: {
        type: :object,
        properties: {
          brand: { type: :string, nullable: true },
          reference: { type: :string, nullable: true },
          material: { type: :integer, nullable: true },
          o_ring: { type: :integer, nullable: true },
          for_replica: { type: :string, nullable: true },
          weight: { type: :float, nullable: true },
          length: { type: :float, nullable: true },
          pric: { type: :float, nullable: true }
        },
        required: ['reference']
      }

      response '201', 'nozzle created' do
        let(:nozzle) { { reference: 'shs' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:nozzle) { { reference: nil } }
        run_test!
      end
    end
  end
end
