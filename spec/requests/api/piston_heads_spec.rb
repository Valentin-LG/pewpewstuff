# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'api/piston heads', type: :request do
  path '/piston_heads' do
    get 'Retrieves all piston heads' do
      tags 'Piston heads'
      produces 'application/json', 'application/xml'

      response '200', 'piston head found' do
        schema type: :array,
               items: {
                 properties: {
                   id: { type: :integer },
                   brand: { type: :string, nullable: true },
                   reference: { type: :string, nullable: true },
                   material: { type: :integer, nullable: true },
                   silenced: { type: :boolean, nullable: true },
                   on_bearing: { type: :boolean, nullable: true },
                   weight: { type: :float, nullable: true },
                   price: { type: :float, nullable: true }
                 }
               }

        run_test!
      end
    end

    path '/piston_heads/{id}' do
      get 'Retrieves a piston head' do
        tags 'Piston heads'
        produces 'application/json', 'application/xml'
        parameter name: :id, in: :path, type: :string

        response '200', 'piston head found' do
          schema type: :object,
                 properties: {
                   id: { type: :integer },
                   brand: { type: :string, nullable: true },
                   reference: { type: :string, nullable: true },
                   material: { type: :integer, nullable: true },
                   silenced: { type: :boolean, nullable: true },
                   on_bearing: { type: :boolean, nullable: true },
                   weight: { type: :float, nullable: true },
                   price: { type: :float, nullable: true }
                 }

          let(:id) { PistonHead.create(reference: 'atm').id }
          run_test!
        end

        response '404', 'piston head not found' do
          let(:id) { 'invalid' }
          run_test!
        end
      end
    end

    post 'Creates a piston head' do
      tags 'Piston heads'
      consumes 'application/json'
      parameter name: :piston_head, in: :body, schema: {
        type: :object,
        properties: {
          brand: { type: :string, nullable: true },
          reference: { type: :string },
          material: { type: :integer, nullable: true },
          silenced: { type: :boolean, nullable: true },
          on_bearing: { type: :boolean, nullable: true },
          weight: { type: :float, nullable: true },
          price: { type: :float, nullable: true }
        },
        required: ['reference']
      }

      response '201', 'piston head created' do
        let(:piston_head) { { reference: 'atm' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:piston_head) { { reference: nil } }
        run_test!
      end
    end
  end
end
