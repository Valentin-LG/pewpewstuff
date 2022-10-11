# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'api/barrels', type: :request do
  path '/barrels' do
    get 'Retrieves all barrels' do
      tags 'Barrels'
      security [basic_auth: []]
      produces 'application/json', 'application/xml'

      response '200', 'barrel found' do
        schema type: :array,
               items: {
                 properties: {
                   id: { type: :integer },
                   brand: { type: :string, nullable: true },
                   reference: { type: :string, nullable: true },
                   material: { type: :integer, nullable: true },
                   length: { type: :float, nullable: true },
                   diameter: { type: :float, nullable: true },
                   compatibility: { type: :integer, nullable: true },
                   price: { type: :float, nullable: true }
                 }
               }

        run_test!
      end
    end

    path '/barrels/{id}' do
      get 'Retrieves a barrel' do
        tags 'Barrels'
        produces 'application/json', 'application/xml'
        parameter name: :id, in: :path, type: :string

        response '200', 'barrel found' do
          schema type: :object,
                 properties: {
                   id: { type: :integer },
                   brand: { type: :string, nullable: true },
                   reference: { type: :string, nullable: true },
                   material: { type: :integer, nullable: true },
                   length: { type: :float, nullable: true },
                   diameter: { type: :float, nullable: true },
                   compatibility: { type: :integer, nullable: true },
                   price: { type: :float, nullable: true }
                 }

          let(:id) { Barrel.create(reference: 'pdi').id }
          run_test!
        end

        response '404', 'barrel not found' do
          let(:id) { 'invalid' }
          run_test!
        end
      end
    end

    post 'Creates a barrel' do
      tags 'Barrels'
      consumes 'application/json'
      parameter name: :barrel, in: :body, schema: {
        type: :object,
        properties: {
          brand: { type: :string, nullable: true },
          reference: { type: :string },
          material: { type: :integer, nullable: true },
          length: { type: :float, nullable: true },
          diameter: { type: :float, nullable: true },
          compatibility: { type: :integer, nullable: true },
          price: { type: :float, nullable: true }
        },
        required: ['reference']
      }

      response '201', 'barrel created' do
        let(:barrel) { { reference: 'SL8' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:barrel) { { reference: nil } }
        run_test!
      end
    end
  end
end
