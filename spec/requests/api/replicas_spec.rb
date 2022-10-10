# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'api/replicas', type: :request do
  path '/replicas' do
    get 'Retrieves all replicas' do
      tags 'Replicas'
      # security [basic_auth: []]
      produces 'application/json', 'application/xml'

      response '200', 'replica found' do
        schema type: :array,
               items: {
                 properties: {
                   id: { type: :integer },
                   name: { type: :string, nullable: true },
                   reference: { type: :string, nullable: true },
                   category: { type: :string, nullable: true },
                   price: { type: :number, nullable: true }
                 }
               }

        run_test!
      end
    end

    path '/replicas/{id}' do
      get 'Retrieves a replica' do
        tags 'Replicas'
        produces 'application/json', 'application/xml'
        parameter name: :id, in: :path, type: :string

        response '200', 'replica found' do
          schema type: :object,
                 properties: {
                   id: { type: :integer },
                   name: { type: :string, nullable: true },
                   reference: { type: :string, nullable: true },
                   category: { type: :string, nullable: true },
                   price: { type: :number, nullable: true }
                 }

          let(:id) { Replica.create(name: 'P90', reference: 'cybergun P90').id }
          run_test!
        end

        response '404', 'replica not found' do
          let(:id) { 'invalid' }
          run_test!
        end
      end
    end

    post 'Creates a replica' do
      tags 'Replicas'
      consumes 'application/json'
      parameter name: :replica, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          reference: { type: :string, nullable: true },
          category: { type: :string, nullable: true },
          price: { type: :number, nullable: true }
        },
        required: ['name']
      }

      response '201', 'replica created' do
        let(:replica) { { name: 'SL8' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:replica) { { name: nil } }
        run_test!
      end
    end
  end
end
