# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'api/cylinder_heads', type: :request do
  path '/cylinder_heads' do
    get 'Retrieves all cylinder heads' do
      tags 'Cylinder Heads'
      produces 'application/json', 'application/xml'

      response '200', 'cylinder head found' do
        schema type: :array,
               items: {
                 properties: {
                   id: { type: :integer },
                   brand: { type: :string, nullable: true },
                   reference: { type: :string, nullable: true },
                   material: { type: :integer, nullable: true },
                   o_ring: { type: :integer, nullable: true },
                   for_replica: { type: :string, nullable: true },
                   silenced: { type: :boolean, nullable: true },
                   weight: { type: :float, nullable: true },
                   price: { type: :float, nullable: true }
                 }
               }

        run_test!
      end
    end

    path '/cylinder_heads/{id}' do
      get 'Retrieves a cylinder head' do
        tags 'Cylinder Heads'
        produces 'application/json', 'application/xml'
        parameter name: :id, in: :path, type: :string

        response '200', 'cylinder head found' do
          schema type: :object,
                 properties: {
                   id: { type: :integer },
                   brand: { type: :string, nullable: true },
                   reference: { type: :string, nullable: true },
                   material: { type: :integer, nullable: true },
                   o_ring: { type: :integer, nullable: true },
                   for_replica: { type: :string, nullable: true },
                   silenced: { type: :boolean, nullable: true },
                   weight: { type: :float, nullable: true },
                   price: { type: :float, nullable: true }
                 }

          let(:id) { CylinderHead.create(reference: 'shs').id }
          run_test!
        end

        response '404', 'cylinder head not found' do
          let(:id) { 'invalid' }
          run_test!
        end
      end
    end

    post 'Creates a cylinder head' do
      tags 'Cylinder Heads'
      consumes 'application/json'
      parameter name: :cylinder_head, in: :body, schema: {
        type: :object,
        properties: {
          brand: { type: :string, nullable: true },
          reference: { type: :string },
          material: { type: :integer, nullable: true },
          o_ring: { type: :integer, nullable: true },
          for_replica: { type: :string, nullable: true },
          silenced: { type: :boolean, nullable: true },
          weight: { type: :float, nullable: true },
          price: { type: :float, nullable: true }
        },
        required: ['reference']
      }

      response '201', 'cylinder head created' do
        let(:cylinder_head) { { reference: 'SL8' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:cylinder_head) { { reference: nil } }
        run_test!
      end
    end
  end
end
