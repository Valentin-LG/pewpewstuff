# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'api/joint_hop_ups', type: :request do
  path '/joint_hop_ups' do
    get 'Retrieves all joint hop ups' do
      tags 'Joint hop ups'
      produces 'application/json', 'application/xml'

      response '200', 'joint hop up found' do
        schema type: :array,
               items: {
                 properties: {
                   id: { type: :integer },
                   brand: { type: :string, nullable: true },
                   reference: { type: :string, nullable: true },
                   material: { type: :integer, nullable: true },
                   length: { type: :float, nullable: true },
                   toughness: { type: :integer, nullable: true },
                   compatibility: { type: :integer, nullable: true },
                   price: { type: :float, nullable: true }
                 }
               }

        run_test!
      end
    end

    path '/joint_hop_ups/{id}' do
      get 'Retrieves a joint hop up' do
        tags 'Joint hop ups'
        produces 'application/json', 'application/xml'
        parameter name: :id, in: :path, type: :string

        response '200', 'joint hop up found' do
          schema type: :object,
                 properties: {
                   id: { type: :integer },
                   brand: { type: :string, nullable: true },
                   reference: { type: :string, nullable: true },
                   material: { type: :integer, nullable: true },
                   length: { type: :float, nullable: true },
                   toughness: { type: :integer, nullable: true },
                   compatibility: { type: :integer, nullable: true },
                   price: { type: :float, nullable: true }
                 }

          let(:id) { JointHopUp.create(reference: 'prometheus').id }
          run_test!
        end

        response '404', 'joint hop up not found' do
          let(:id) { 'invalid' }
          run_test!
        end
      end
    end

    post 'Creates a joint hop up' do
      tags 'Joint hop ups'
      consumes 'application/json'
      parameter name: :joint_hop_up, in: :body, schema: {
        type: :object,
        properties: {
          brand: { type: :string, nullable: true },
          reference: { type: :string, nullable: true },
          material: { type: :integer, nullable: true },
          length: { type: :float, nullable: true },
          toughness: { type: :integer, nullable: true },
          compatibility: { type: :integer, nullable: true },
          price: { type: :float, nullable: true }
        },
        required: ['reference']
      }

      response '201', 'joint hop up created' do
        let(:joint_hop_up) { { reference: 'SL8' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:joint_hop_up) { { reference: nil } }
        run_test!
      end
    end
  end
end
