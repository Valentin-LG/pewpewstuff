# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'api/spring_guides', type: :request do
  path '/spring_guides' do
    get 'Retrieves all spring guides' do
      tags 'Spring guides'
      produces 'application/json', 'application/xml'

      response '200', 'spring guide found' do
        schema type: :array,
               items: {
                 properties: {
                   id: { type: :integer },
                   brand: { type: :string, nullable: true },
                   reference: { type: :string, nullable: true },
                   length: { type: :float, nullable: true },
                   quick_detach: { type: :boolean, nullable: true },
                   on_bearing: { type: :boolean, nullable: true },
                   weight: { type: :float, nullable: true },
                   price: { type: :float, nullable: true }
                 }
               }

        run_test!
      end
    end

    path '/spring_guides/{id}' do
      get 'Retrieves a spring_guide' do
        tags 'Spring guides'
        produces 'application/json', 'application/xml'
        parameter name: :id, in: :path, type: :string

        response '200', 'spring guide found' do
          schema type: :object,
                 properties: {
                   id: { type: :integer },
                   brand: { type: :string, nullable: true },
                   reference: { type: :string, nullable: true },
                   length: { type: :float, nullable: true },
                   quick_detach: { type: :boolean, nullable: true },
                   on_bearing: { type: :boolean, nullable: true },
                   weight: { type: :float, nullable: true },
                   price: { type: :float, nullable: true }
                 }

          let(:id) { SpringGuide.create(reference: 'atm').id }
          run_test!
        end

        response '404', 'spring guide not found' do
          let(:id) { 'invalid' }
          run_test!
        end
      end
    end

    post 'Creates a spring guide' do
      tags 'Spring guides'
      consumes 'application/json'
      parameter name: :spring_guide, in: :body, schema: {
        type: :object,
        properties: {
          brand: { type: :string, nullable: true },
          reference: { type: :string },
          length: { type: :float, nullable: true },
          quick_detach: { type: :boolean, nullable: true },
          on_bearing: { type: :boolean, nullable: true },
          weight: { type: :float, nullable: true },
          price: { type: :float, nullable: true }
        },
        required: ['reference']
      }

      response '201', 'spring_guide created' do
        let(:spring_guide) { { reference: 'atm' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:spring_guide) { { reference: nil } }
        run_test!
      end
    end
  end
end
