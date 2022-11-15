# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'api/cylinders', type: :request do
  path '/cylinders' do
    get 'Retrieves all cylinders' do
      tags 'Cylinders'
      produces 'application/json', 'application/xml'

      response '200', 'cylinder found' do
        schema type: :array, items: { properties: { id: { type: :integer }, brand: { type: :string, nullable: true }, reference: { type: :string, nullable: true }, material: { type: :integer, nullable: true }, weight: { type: :float, nullable: true }, price: { type: :float, nullable: true } } }

        run_test!
      end
    end

    path '/cylinders/{id}' do
      get 'Retrieves a cylinder' do
        tags 'Cylinders'
        produces 'application/json', 'application/xml'
        parameter name: :id, in: :path, type: :string

        response '200', 'cylinder found' do
          schema type: :object, properties: { id: { type: :integer }, brand: { type: :string, nullable: true }, reference: { type: :string, nullable: true }, material: { type: :integer, nullable: true }, weight: { type: :float, nullable: true }, price: { type: :float, nullable: true } }

          let(:id) { Cylinder.create(reference: 'shs').id }
          run_test!
        end

        response '404', 'cylinder not found' do
          let(:id) { 'invalid' }
          run_test!
        end
      end
    end

    post 'Creates a cylinder' do
      tags 'Cylinders'
      consumes 'application/json'
      parameter name: :cylinder, in: :body, schema: { type: :object, properties: { brand: { type: :string, nullable: true }, reference: { type: :string }, material: { type: :integer, nullable: true }, weight: { type: :float, nullable: true }, price: { type: :float, nullable: true } }, required: ['reference'] }

      response '201', 'cylinder created' do
        let(:cylinder) { { reference: 'SL8' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:cylinder) { { reference: nil } }
        run_test!
      end
    end
  end
end
