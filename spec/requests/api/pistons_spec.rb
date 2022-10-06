# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'api/pistons', type: :request do
  path '/pistons' do
    get 'Retrieves all pistons' do
      tags 'Pistons'
      produces 'application/json', 'application/xml'

      response '200', 'piston found' do
        schema type: :array,
               items: {
                 properties: {
                   id: { type: :integer },
                   brand: { type: :string, nullable: true },
                   reference: { type: :string, nullable: true },
                   teeth_number: { type: :integer, nullable: true },
                   teeth_material: { type: :integer, nullable: true },
                   material: { type: :integer, nullable: true },
                   weight: { type: :float, nullable: true },
                   price: { type: :float, nullable: true }
                 }
               }

        run_test!
      end
    end

    path '/pistons/{id}' do
      get 'Retrieves a piston' do
        tags 'Pistons'
        produces 'application/json', 'application/xml'
        parameter name: :id, in: :path, type: :string

        response '200', 'piston found' do
          schema type: :object,
                 properties: {
                   id: { type: :integer },
                   brand: { type: :string, nullable: true },
                   reference: { type: :string, nullable: true },
                   teeth_number: { type: :integer, nullable: true },
                   teeth_material: { type: :integer, nullable: true },
                   material: { type: :integer, nullable: true },
                   weight: { type: :float, nullable: true },
                   price: { type: :float, nullable: true }
                 }

          let(:id) { Piston.create(reference: 'atm').id }
          run_test!
        end

        response '404', 'piston not found' do
          let(:id) { 'invalid' }
          run_test!
        end
      end
    end

    post 'Creates a piston' do
      tags 'Pistons'
      consumes 'application/json'
      parameter name: :piston, in: :body, schema: {
        type: :object,
        properties: {
          brand: { type: :string, nullable: true },
          reference: { type: :string, nullable: true },
          teeth_number: { type: :integer, nullable: true },
          teeth_material: { type: :integer, nullable: true },
          material: { type: :integer, nullable: true },
          weight: { type: :float, nullable: true },
          price: { type: :float, nullable: true }
        },
        required: ['reference']
      }

      response '201', 'piston created' do
        let(:piston) { { reference: 'atm' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:piston) { { reference: nil } }
        run_test!
      end
    end
  end
end
